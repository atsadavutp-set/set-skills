---
name: test-plan
description: >
  Risk-based test plan for a story/feature — scope, pyramid, Jest-first approach.
  Trigger EN: /test-plan, test plan, testing strategy, what to test, sprint test planning.
  Trigger TH: /test-plan, ออกแผน test, test plan, วางแผน test, ควร test อะไร, กลยุทธ์การ test.
---

# Test Plan / แผนการทดสอบ

High-level test plan for a story or feature. Spec and automation come after.

## Language / ภาษา

Detect the user's language from their latest message.

- User writes Thai → respond entirely in Thai (mantra, steps, output).
- User writes English → respond entirely in English.
- Mixed → use the dominant language; if unclear, ask once.
- Always keep: code, file paths, Jira keys, framework names in original form.

## Recite verbatim — EN

> **Mantra:**
> 1. **Scope before cases** — what's in, out, and assumed.
> 2. **Risk drives depth** — P0 gets the most coverage.
> 3. **Jest first** — Playwright only when Jest cannot cover it.
> 4. **Exit criteria are explicit** — know when testing is done.

## ท่อง verbatim — TH

> **มนตรา:**
> 1. **Scope ก่อน cases** — in, out, assumptions ชัด
> 2. **Risk กำหนดความลึก** — P0 ได้ coverage มากสุด
> 3. **Jest ก่อน** — Playwright เฉพาะที่ Jest cover ไม่ได้
> 4. **Exit criteria ชัด** — รู้ว่า test เสร็จเมื่อไหร่

Then begin work.

## Workflow (execute in order)

1. Summarize scope — in / out / assumptions / สรุป scope
2. Risk assessment — P0–P3 with rationale / ประเมิน risk
3. Test approach per risk area — Jest / Playwright / Manual / combo
4. **Pyramid check** — justify every Playwright row / ทุก Playwright ต้องมีเหตุผล
5. Environment & data — env, owners, dependencies / env และ data
6. Effort & priority — order, rough estimate, release blockers / ลำดับและ estimate

## Required inputs — refuse without these

- [ ] Story with acceptance criteria (Green or Yellow from `story-refinement`)
- [ ] Feature scope or PR link if testing a specific change

## Output template — EN

```markdown
## Test Plan: [STORY-KEY / Feature]
### Scope
- In scope: [...]
- Out of scope: [...]
- Assumptions: [...]
### Risk Matrix
| Area | Risk | Approach | Framework | Rationale |
### Environment & Data
### Entry Criteria
### Exit Criteria
### Open Risks
```

## Output template — TH

```markdown
## แผน Test: [STORY-KEY / Feature]
### Scope
- ใน scope: [...]
- นอก scope: [...]
- สมมติฐาน: [...]
### ตาราง Risk
| พื้นที่ | Risk | วิธี | Framework | เหตุผล |
### Environment & Data
### Entry Criteria
### Exit Criteria
### Risk ที่ยังเปิด
```

## When NOT to use / เมื่อไม่ใช้

- EN: No AC and story is Red — use `story-refinement` first.
- TH: ไม่มี AC และ story ยัง Red — ใช้ `story-refinement` ก่อน

## Cross-references

- Input from: `story-refinement`
- Output to: `test-spec`, `test-data-blueprint`
