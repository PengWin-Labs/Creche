#!/usr/bin/env python3
"""
Unit tests for extract.py

Run:  python3 tests/test_extract.py
      python3 -m pytest tests/test_extract.py -v  (if pytest installed)
"""

import sys
import os
import subprocess
import unittest
import tempfile

SKILL_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
EXTRACT  = os.path.join(SKILL_DIR, "extract.py")
FIXTURE  = os.path.join(SKILL_DIR, "tests", "fixtures", "sample_transcript.md")


def run_extract(args=None, stdin_text=None, env_override=None):
    """Helper: run extract.py and return (stdout, stderr, returncode)."""
    cmd = [sys.executable, EXTRACT] + (args or [])
    env = {**os.environ, "ANTHROPIC_API_KEY": ""}  # force rules-based in tests
    if env_override:
        env.update(env_override)
    result = subprocess.run(
        cmd,
        input=stdin_text,
        capture_output=True,
        text=True,
        env=env,
    )
    return result.stdout, result.stderr, result.returncode


class TestExtractFromFile(unittest.TestCase):

    def test_file_input_succeeds(self):
        out, err, code = run_extract([FIXTURE, "--source-label", "test-session"])
        self.assertEqual(code, 0, f"Should exit 0. stderr={err}")
        self.assertIn("Concept Digest", out, "Output should contain header")

    def test_output_has_sections(self):
        out, _, code = run_extract([FIXTURE])
        self.assertEqual(code, 0)
        # At least one of the expected sections should appear
        has_section = any(h in out for h in [
            "## Core Concepts", "## Decisions Made",
            "## Open Questions", "## Insights"
        ])
        self.assertTrue(has_section, f"Expected at least one section. Got:\n{out}")

    def test_source_label_in_header(self):
        label = "my-test-label-xyz"
        out, _, code = run_extract([FIXTURE, "--source-label", label])
        self.assertEqual(code, 0)
        self.assertIn(label, out, "Source label should appear in output header")


class TestExtractFromStdin(unittest.TestCase):

    def test_stdin_input(self):
        text = "The key principle is that recursion operates at every scale. We decided to use event-driven triggers."
        out, err, code = run_extract(["-"], stdin_text=text)
        self.assertEqual(code, 0, f"stdin mode should work. stderr={err}")

    def test_empty_stdin_exits_1(self):
        out, err, code = run_extract(["-"], stdin_text="")
        self.assertEqual(code, 1, "Empty input should exit with code 1")
        self.assertIn("empty", err.lower())


class TestExtractEdgeCases(unittest.TestCase):

    def test_missing_file_exits_1(self):
        out, err, code = run_extract(["/nonexistent/path/file.md"])
        self.assertEqual(code, 1)

    def test_dry_run_flag(self):
        out, err, code = run_extract([FIXTURE, "--dry-run"])
        # dry-run with no API key just falls through to rules-based (no API call)
        self.assertEqual(code, 0)

    def test_no_personal_details(self):
        """Output should not contain known personal names from fixture."""
        out, _, code = run_extract([FIXTURE])
        self.assertEqual(code, 0)
        # The fixture is already anonymised, but test the extraction doesn't
        # add names that weren't there
        # (This is a smoke test — real personal-detail filtering is in the prompt)
        self.assertNotIn("John", out)
        self.assertNotIn("Jane", out)

    def test_whitespace_only_stdin_exits_1(self):
        out, err, code = run_extract(["-"], stdin_text="   \n\n\t\n")
        self.assertEqual(code, 1)


class TestOutputFormat(unittest.TestCase):

    def test_output_starts_with_heading(self):
        out, _, code = run_extract([FIXTURE])
        self.assertEqual(code, 0)
        self.assertTrue(out.startswith("# "), f"Output should start with '# '. Got: {out[:50]!r}")

    def test_generated_date_in_output(self):
        from datetime import date
        today = date.today().isoformat()
        out, _, code = run_extract([FIXTURE])
        self.assertEqual(code, 0)
        self.assertIn(today, out, "Today's date should appear in output")


if __name__ == "__main__":
    loader = unittest.TestLoader()
    suite  = loader.loadTestsFromModule(sys.modules[__name__])
    runner = unittest.TextTestRunner(verbosity=2)
    result = runner.run(suite)
    sys.exit(0 if result.wasSuccessful() else 1)
