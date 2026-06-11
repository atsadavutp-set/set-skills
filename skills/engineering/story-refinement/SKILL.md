---
name: story-refinement
description: >
  SET story refinement for testability — AC gaps, questions, DoD test scope.
  Trigger EN: /story-refinement, refinement, grooming, testable AC, sprint planning, story review.
  Trigger TH: /story-refinement, รีไฟน์, รีไฟน์เมนต์, groom, story test ได้ไหม,
  acceptance criteria, วางแผน sprint, ตรวจ story, refinement.
---

# Story Refinement / การรีไฟน์ Story

SET participation in refinement. Make stories testable before dev starts.

## Language / ภาษา

Detect the user's language from their latest message.

- User writes Thai → respond entirely in Thai (mantra, steps, output).
- User writes English → respond entirely in English.
- Mixed → use the dominant language; if unclear, ask once.
- Always keep: code, file paths, Jira keys, framework names in original form.

## Recite verbatim — EN

> **Mantra:**
> 1. **AC must be observable** — measurable from outside, not "works correctly."
> 2. **Every AC needs an oracle** — how do we know pass vs fail?
> 3. **Edge cases belong in the story** — not surprises during test.
> 4. **DoD must include test scope** — what must be tested before merge.

## ท่อง verbatim — TH

> **มนตรา:**
> 1. **AC ต้อง observable** — วัดผลได้จากภายนอก ไม่ใช่ "ทำงานถูกต้อง"
> 2. **ทุก AC ต้องมี oracle** — รู้ได้ยังไงว่า pass/fail?
> 3. **Edge cases ต้องอยู่ใน story** — ไม่ใช่ surprise ตอน test
> 4. **DoD ต้องรวม test scope** — อะไรต้องมี test ก่อน merge

Then begin work.

## Workflow (execute in order)

1. Read story/task — state intent in one sentence / อ่าน story สรุป intent ประโยคเดียว
2. Review each AC — testable? measurable? ambiguous? / ตรวจ AC ทีละข้อ
3. List **testability gaps** — missing AC, hidden deps, undefined errors / ระบุช่องว่าง
4. Ask refinement questions (max 5, risk-ordered) / ถามคำถามไม่เกิน 5 ข้อ เรียงตาม risk
5. Propose **suggested AC additions** SET needs before dev / เสนอ AC เพิ่ม

## Required inputs — refuse without these

- [ ] Story description or summary
- [ ] At least draft acceptance criteria (or explicit "none yet" to flag Red)

## Output template — EN

```markdown
## Refinement Notes: [STORY-KEY]
- **Testability:** Green / Yellow / Red
- **Intent:** [one sentence]
- **AC gaps:** [list]
- **Questions for team:** [numbered, max 5]
- **Suggested AC additions:** [list]
- **Ready for test-plan:** Yes / No — [what's missing if No]
```

## Output template — TH

```markdown
## บันทึกรีไฟน์: [STORY-KEY]
- **Testability:** Green / Yellow / Red
- **Intent:** [หนึ่งประโยค]
- **AC ที่ขาด/คลุมเครือ:** [รายการ]
- **คำถามถามทีม:** [ไม่เกิน 5 ข้อ]
- **AC ที่แนะนำเพิ่ม:** [รายการ]
- **พร้อม test-plan:** ใช่ / ไม่ — [ขาดอะไรถ้าไม่]
```

## When NOT to use / เมื่อไม่ใช้

- EN: Story is already in test execution — use `test-plan` or `test-spec`.
- TH: Story อยู่ในขั้น test แล้ว — ใช้ `test-plan` หรือ `test-spec`

## Cross-references

- Output to: `test-plan` (when Green or Yellow with resolved gaps)
