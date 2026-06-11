# set-skills

Agent skills for Software Engineers in Test (SET/QA/Test).

## Layout

Skills live under `skills/`, grouped into buckets:

- `engineering/` — daily SET work and planning pipeline
- `productivity/` — release, stakeholder communication, triage
- `frameworks/` — Jest (primary), Playwright, Robot Framework, manual testing
- `misc/` — used less often but shippable
- `personal/` — tied to individual setup, not promoted
- `in-progress/` — drafts not yet ready to ship
- `deprecated/` — no longer used

Each skill is its own directory containing a `SKILL.md` (YAML frontmatter — `name` and `description`) and optional `examples.md`.

## Bilingual rule (mandatory)

Every shippable skill must be **bilingual EN/TH**:

- `description` must include `Trigger EN:` and `Trigger TH:` keyword lists
- Body must include a **Language / ภาษา** policy block (with Mixed-language rule)
- Mantras must have paired EN and TH blocks (recite verbatim)
- Output templates must have paired **Output template — EN** and **TH** blocks
- **When NOT to use / เมื่อไม่ใช้** with EN and TH bullets
- **Required inputs — refuse without these** in every skill
- `examples.md` with **## EN** and **## TH** scenarios
- Run `./scripts/validate-skills.sh` before shipping; skills failing validation stay in `in-progress/`

## Shippable skills

Skills in `engineering/`, `productivity/`, `frameworks/`, and `misc/` must have a reference in the top-level `README.md`.

Skills in `personal/`, `in-progress/`, and `deprecated/` must not appear in `README.md`.

Each README entry must link the skill name to its `SKILL.md`.

## Tech stack priority

1. **Jest** — default for unit, integration, API logic
2. **Playwright** — critical UI journeys Jest cannot cover
3. **Robot Framework** — legacy suites
4. **Manual** — exploratory and UX judgment

## Install

```bash
# Cursor (recommended)
./scripts/link-skills.sh cursor

# Claude Code
./scripts/link-skills.sh claude

# List all skills
./scripts/list-skills.sh
```
