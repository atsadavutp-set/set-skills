---
name: test-spec
description: >
  Detailed test cases from a test plan — steps, expected, framework mapping. Spec only, no code.
  Trigger EN: /test-spec, test cases, test spec, write test scenarios, testcase design.
  Trigger TH: /test-spec, เขียน test case, test spec, ออกแบบ test case, สเปค test.
---

# Test Spec / สเปค Test Case

Break a test plan into detailed test cases. Do not write test code here.

## Language / ภาษา

Detect the user's language from their latest message.

- User writes Thai → respond entirely in Thai (mantra, steps, output).
- User writes English → respond entirely in English.
- Mixed → use the dominant language; if unclear, ask once.
- Always keep: code, file paths, Jira keys, framework names in original form.

## Recite verbatim — EN

> **Mantra:**
> 1. **One case, one oracle** — each case proves exactly one thing.
> 2. **P0 needs a negative path** — happy path alone is not enough.
> 3. **Default framework is Jest** — deviate only per test plan rationale.
> 4. **Spec is not code** — no implementation in this skill.

## ท่อง verbatim — TH

> **มนตรา:**
> 1. **หนึ่ง case หนึ่ง oracle** — แต่ละ case พิสูจน์สิ่งเดียว
> 2. **P0 ต้องมี negative path** — happy path อย่างเดียวไม่พอ
> 3. **Framework default คือ Jest** — เปลี่ยนเฉพาะที่ plan ระบุ
> 4. **Spec ไม่ใช่ code** — ห้ามเขียน implementation ที่นี่

Then begin work.

## Workflow (execute in order)

1. Break plan into atomic test cases / แตก plan เป็น cases
2. Write spec per case — preconditions, steps, expected / เขียน spec ต่อ case
3. Assign framework — Jest default; Playwright per plan / กำหนด framework
4. Define test data needs per case / ระบุ data ต่อ case
5. Map traceability — TC-ID ↔ AC ↔ risk tier / map traceability

## Required inputs — refuse without these

- [ ] Approved or draft `test-plan` (risk matrix + scope)

## Output template — EN

```markdown
## Test Spec: [STORY-KEY]
| ID | AC Ref | Priority | Title | Preconditions | Steps | Expected | Framework | Automatable |
| TC-001 | AC-1 | P0 | ... | ... | 1. ... | ... | Jest | Yes |
```

## Output template — TH

```markdown
## สเปค Test: [STORY-KEY]
| ID | AC Ref | Priority | หัวข้อ | Preconditions | ขั้นตอน | ผลที่คาดหวัง | Framework | Automate ได้ |
| TC-001 | AC-1 | P0 | ... | ... | 1. ... | ... | Jest | ใช่ |
```

## Rules / กฎ

- Every P0 must have at least one negative case
- Playwright cases must cite test-plan rationale
- Do not write Jest or Playwright code in output

## When NOT to use / เมื่อไม่ใช้

- EN: No test plan — use `test-plan` first.
- TH: ยังไม่มี test plan — ใช้ `test-plan` ก่อน

## Cross-references

- Input from: `test-plan`
- Output to: `test-data-blueprint`, `jest-patterns`, `playwright-patterns`, `exploratory-charter`
