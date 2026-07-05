---
name: magisterium-dogma-research
description: Assist personal research for one Catholic dogma using Magisterium AI or the local Magisterium REST pipeline. Use when the user provides a dogma name plus personal notes, study concerns, objections, hypotheses, or desired emphases and wants candidate magisterial sources, short citations, public links, questions for study, and a manual-review report for the dogmasLogica project. Also use when preparing a one-dogma-per-day research session without automatically approving doctrine or editing the canonical Prolog base.
---

# Magisterium Dogma Research

## Purpose

Research exactly one Catholic dogma at a time, using Magisterium AI as an assistant for finding candidate sources. Treat all results as study material until the human author approves them.

The user normally provides:

- Dogma name or `DogmaId`.
- Personal considerations, doubts, objections, hypotheses, or study focus.
- Optional language preference, usually Portuguese.

## Core Rules

- Do not decide dogmatic truth from API output.
- Do not promote candidates into canonical Prolog facts unless the user explicitly asks after reviewing them.
- Prefer official magisterial sources: Catechism, councils, papal documents, Vatican pages, and documents cited by those sources.
- Keep citations short and attach reference and public URL when available.
- Preserve the user's personal considerations as study prompts; do not rewrite them into official doctrine.
- Respect the project rhythm: one dogma per day and a conservative 50-request daily budget.
- If credentials or API access are missing, produce a dry-run research plan instead of inventing results.

## Workflow

1. Identify the dogma.
   - Normalize the title to a stable `DogmaId` when possible.
   - If working inside `dogmasLogica`, check `bases/nucleo/magisterio_definicoes.pl` for an existing `dogma/2`.

2. Parse the user's considerations.
   - Separate them into: definition questions, source questions, biblical anchors, objections, logical concerns, and personal study notes.
   - Keep the original wording in a "Notas do autor" section.

3. Plan 3 to 8 focused searches.
   - Include at least one query for the Catechism.
   - Include at least one query for councils or papal documents when relevant.
   - Include one query that reflects the user's specific concern.
   - Avoid broad, high-cost exploratory searches.

4. Use Magisterium.
   - Inside this repo, prefer the local script:

```bash
scripts/magisterium_research.py <dogma_id> \
  --query "<query 1>" \
  --query "<query 2>" \
  --dry-run
```

   - After checking planned requests, run without `--dry-run` only if `MAGISTERIUM_API_KEY` is available and the user expects live research.
   - Add `--chat` only when a synthesis with citations is useful.
   - Outside this repo, use the Magisterium Search/Chat API or web interface following the same query budget and manual-review rules.

5. Evaluate candidates.
   - Mark each source as: `forte`, `util`, `fraca`, or `descartar`.
   - Explain why in terms of official status, directness, reference quality, public URL, and relation to the dogma.
   - Never use "Magisterium AI said so" as a reason for approval.

6. Produce the report.
   - Use `references/research-report-template.md` when a structured artifact is needed.
   - Use `references/generic-agent-prompt.md` when the user wants a pasteable prompt for Claude, Gemini, or another agent that does not load Codex skills directly.
   - Include candidate Prolog snippets only under a clearly labeled "rascunho" section.
   - End with a small checklist for the human author's review.

## Output Expectations

Return a concise study dossier in Portuguese unless the user requests another language:

- Dogma and study focus.
- Search queries used or proposed.
- Candidate sources with reference, short citation, URL, and status.
- Notes connecting the sources to the user's considerations.
- Open questions for the next study session.
- Optional draft Prolog facts, clearly marked as not approved.

## Generic Agent Use

For Claude, Gemini, or any agent without native Codex skill loading, paste the contents of `references/generic-agent-prompt.md`, then append the dogma name and the user's personal considerations.

## Repo-Specific Integration

When working in `dogmasLogica`, use these files:

- `docs/magisterium_api.md` for endpoint and policy details.
- `docs/rotina_dogma_diario.md` for the daily process.
- `scripts/magisterium_research.py` for REST calls and ledger control.
- `research/candidates/` for generated candidate artifacts.
- `bases/nucleo/fontes_magisteriais.pl` only after human approval.
- `bases/nucleo/definicoes_dogmaticas.pl` only after a source and definition are approved.

After any approved Prolog edit, validate with:

```bash
swipl -s tests/tracador_tests.pl
swipl -s scripts/export_proofs.pl
```
