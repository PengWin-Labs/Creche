#!/usr/bin/env python3
"""
extract.py — concept extractor for nightly-retro skill

Reads a chat transcript or exported conversation from stdin or a file path.
Outputs a structured markdown concept digest to stdout.

Usage:
    python3 extract.py <input_file> [--dry-run] [--source-label "label"]
    echo "..." | python3 extract.py - [--dry-run]

Exit codes:
    0  success
    1  input empty or unreadable
    2  Claude API call failed

Design:
    - Calls Claude API (claude-haiku) with ANTHROPIC_API_KEY env var.
    - Falls back to heuristic extraction if no key is set.
    - NO personal details land in output — the extraction prompt enforces this.
"""

import sys
import os
import json
import re
import argparse
import urllib.request
import urllib.error
from datetime import date

CLAUDE_API_URL = "https://api.anthropic.com/v1/messages"
MODEL = "claude-haiku-4-5-20251001"
MAX_TOKENS = 1024

EXTRACTION_PROMPT = """\
You are a concept-extraction agent for a founder's second brain.

Read the chat transcript below and produce a tight Markdown digest of the
INTELLECTUAL content only.

STRICT RULES
- Extract: core concepts, frameworks, decisions, open questions, named insights.
- Strip ALL personal details: people's names, locations, health info, financials,
  relationship details, or anything that identifies a person.
- Do NOT summarise conversation flow. Output only persistent signal.
- Use the section structure below. Omit sections with no content.
- One tight sentence per bullet. No padding.

OUTPUT STRUCTURE:
## Core Concepts
- …

## Decisions Made
- …

## Open Questions
- …

## Insights / Named Patterns
- …

## Action Items (conceptual, not personal)
- …

TRANSCRIPT
{transcript}
"""

QUESTION_RE = re.compile(r".+\?$")
DECISION_KW = ["decided","we will","going with","chosen","confirmed","agreed","will use","the plan is","locked in"]
CONCEPT_KW  = ["means","defined as","is a","are a","the idea","the pattern","the principle","the model","the framework","the shape"]


def rules_based_extract(text):
    sentences = [s.strip() for s in re.split(r"(?<=[.!?])\s+", text) if len(s.strip()) > 20]
    concepts, decisions, questions, insights = [], [], [], []
    for s in sentences:
        sl = s.lower()
        if QUESTION_RE.match(s) and len(s) < 200:
            questions.append(s)
        elif any(k in sl for k in DECISION_KW):
            decisions.append(s)
        elif any(k in sl for k in CONCEPT_KW):
            concepts.append(s)
        elif len(s) > 60:
            insights.append(s)

    def cap(lst, n=8):
        seen, out = set(), []
        for x in lst:
            key = x[:60]
            if key not in seen:
                seen.add(key); out.append(x)
            if len(out) >= n: break
        return out

    return dict(concepts=cap(concepts), decisions=cap(decisions),
                questions=cap(questions), insights=cap(insights, 5), actions=[])


def render_rules(sections, label):
    today = date.today().isoformat()
    lines = [f"# Concept Digest — {label}",
             f"_Generated: {today} · extraction: rules-based (no ANTHROPIC_API_KEY)_", ""]
    for key, header in [("concepts","## Core Concepts"),("decisions","## Decisions Made"),
                        ("questions","## Open Questions"),("insights","## Insights / Named Patterns"),
                        ("actions","## Action Items")]:
        items = sections.get(key, [])
        if items:
            lines.append(header)
            lines += [f"- {i}" for i in items]
            lines.append("")
    return "\n".join(lines)


def api_extract(text, api_key, dry_run=False):
    prompt = EXTRACTION_PROMPT.format(transcript=text[:12000])
    if dry_run:
        return f"[DRY RUN] Would call {MODEL} with {len(text)} chars"
    payload = {"model": MODEL, "max_tokens": MAX_TOKENS,
               "messages": [{"role": "user", "content": prompt}]}
    req = urllib.request.Request(
        CLAUDE_API_URL, data=json.dumps(payload).encode(),
        headers={"x-api-key": api_key, "anthropic-version": "2023-06-01",
                 "content-type": "application/json"}, method="POST")
    try:
        with urllib.request.urlopen(req, timeout=30) as resp:
            body = json.loads(resp.read())
            return body["content"][0]["text"]
    except urllib.error.HTTPError as e:
        sys.stderr.write(f"API error {e.code}: {e.read().decode()}\n"); sys.exit(2)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("input", nargs="?", default="-")
    parser.add_argument("--dry-run", action="store_true")
    parser.add_argument("--source-label", default="Cowork Session")
    args = parser.parse_args()

    if args.input == "-":
        text = sys.stdin.read()
    else:
        try:
            with open(args.input, "r", encoding="utf-8") as f:
                text = f.read()
        except OSError as e:
            sys.stderr.write(f"Cannot read {args.input}: {e}\n"); sys.exit(1)

    text = text.strip()
    if not text:
        sys.stderr.write("Input is empty.\n"); sys.exit(1)

    api_key = os.environ.get("ANTHROPIC_API_KEY", "")
    today = date.today().isoformat()

    if api_key:
        body = api_extract(text, api_key, dry_run=args.dry_run)
        if args.dry_run:
            print(body)
        else:
            print(f"# Concept Digest — {args.source_label}\n_Generated: {today} · model: {MODEL}_\n\n{body}")
    else:
        sys.stderr.write("ANTHROPIC_API_KEY not set — rules-based fallback.\n")
        print(render_rules(rules_based_extract(text), args.source_label))


if __name__ == "__main__":
    main()
