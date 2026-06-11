---
name: regression-scope
description: >
  Select test suites for a change — smoke, targeted, or full regression.
  Trigger EN: /regression-scope, what tests to run, regression selection, test scope CI.
  Trigger TH: /regression-scope, รัน test อะไร, เลือก regression, scope test, ต้องรัน suite ไหน.
---

# Regression Scope / เลือกขอบเขต Regression

Choose what to run for a given change. Do not default to full suite every time.

## Language / ภาษา

Detect the user's language from their latest message.

- User writes Thai → respond entirely in Thai (mantra, steps, output).
- User writes English → respond entirely in English.
- Mixed → use the dominant language; if unclear, ask once.
- Always keep: code, file paths, Jira keys, framework names in original form.

## Recite verbatim — EN

> **Mantra:**
> 1. **Blast radius first** — what modules does this change touch?
> 2. **Three tiers** — smoke, targeted, full — pick deliberately.
> 3. **Skip with reason** — not running something is a decision.
> 4. **Jest before Playwright** — faster feedback first.

## ท่อง verbatim — TH

> **มนตรา:**
> 1. **Blast radius ก่อน** — change กระทบ module ไหน
> 2. **สามระดับ** — smoke, targeted, full — เลือกอย่างมีเหตุผล
> 3. **ข้ามต้องมีเหตุผล** — ไม่รันคือการตัดสินใจ
> 4. **Jest ก่อน Playwright** — feedback เร็วก่อน

Then begin work.

## Workflow (execute in order)

1. Analyze blast radius — files, modules, APIs changed / วิเคราะห์ blast radius
2. Map to suites — Jest unit, Jest integration, Playwright, Robot / map suite
3. Propose three tiers:
   - **Smoke** (≤5 min) — health + P0 paths
   - **Targeted** — affected modules only
   - **Full** — pre-release only
4. List suites **not** to run with rationale / สิ่งที่ไม่รัน
5. Order and duration estimate / ลำดับและเวลา

## Required inputs — refuse without these

- [ ] PR, commit, or change description
- [ ] Available suite names or project test layout (ask if unknown)

## Output template — EN

```markdown
## Regression Scope: [PR-xxx / change]
### Recommended tier: Smoke / Targeted / Full
### Run order
| Order | Suite | Framework | Est. duration | Rationale |
### Skip
| Suite | Reason |
### Total estimate: [time]
```

## Output template — TH

```markdown
## ขอบเขต Regression: [PR-xxx / change]
### ระดับที่แนะนำ: Smoke / Targeted / Full
### ลำดับรัน
| ลำดับ | Suite | Framework | เวลาโดยประมาณ | เหตุผล |
### ไม่รัน
| Suite | เหตุผล |
### รวมเวลา: [time]
```

## When NOT to use / เมื่อไม่ใช้

- EN: Handoff is Red or env not verified — use `dev-handoff` or `env-readiness` first.
- TH: Handoff เป็น Red หรือ env ยังไม่ยืนยัน — ใช้ `dev-handoff` หรือ `env-readiness` ก่อน

## Cross-references

- Input from: `dev-handoff`, `pr-test-gate`
- Output to: `run-report`
