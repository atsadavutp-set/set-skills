---
name: scrutinize-tests
description: >
  Jest-first test code review — intent, oracle, mocks, determinism, pyramid ROI.
  Trigger EN: /scrutinize-tests, review tests, audit test suite, test PR review.
  Trigger TH: /scrutinize-tests, รีวิว test, ตรวจ test, test ดีไหม, audit test.
---

# Scrutinize Tests / ตรวจสอบ Test

Outsider review of test code. Jest-first lens; apply Playwright rules when relevant.

## Language / ภาษา

Detect the user's language from their latest message.

- User writes Thai → respond entirely in Thai (mantra, steps, output).
- User writes English → respond entirely in English.
- Mixed → use the dominant language; if unclear, ask once.
- Always keep: code, file paths, Jira keys, framework names in original form.

## Recite verbatim — EN

> **Mantra:**
> 1. **State the intent** — one sentence or the test is unclear.
> 2. **Check the oracle** — behavior or implementation?
> 3. **Guard determinism** — async, mocks, shared state, timers.
> 4. **Question the pyramid** — is this the right layer?

## ท่อง verbatim — TH

> **มนตรา:**
> 1. **บอก intent** — หนึ่งประโยค ไม่ได้แปลว่า test ไม่ชัด
> 2. **ตรวจ oracle** — behavior หรือ implementation?
> 3. **กัน non-determinism** — async, mock, shared state, timer
> 4. **ถาม pyramid** — layer นี้ถูกไหม?

Then begin work.

## Workflow (execute in order)

1. **Intent** — what does this test prove? / พิสูจน์อะไร
2. **Oracle** — assertions match required behavior? / assertion ตรง behavior?
3. **Mock boundary** (Jest) — mocks hide real failures? / mock บัง bug จริง?
4. **Determinism** — flake risks: wait, order, clock, random / ความเสี่ยง flake
5. **Maintainability** — duplication, selectors (Playwright: role > CSS) / ดูแลรักษา
6. **Pyramid ROI** — should this be Jest instead of Playwright or vice versa? / ROI

## Required inputs — refuse without these

- [ ] Test file, PR diff, or test snippet

## Output template — EN

```markdown
## Scrutinize: [file or PR]
### Findings
| What to change | Why | Evidence |
|----------------|-----|----------|
| Replace `toHaveBeenCalledWith` with assertion on return value | Oracle checks implementation, not contract | `auth.test.ts:42` |
| Add `await` before `page.click` | Race condition — element may not be ready | `checkout.spec.ts:18` |
| Move API setup to `beforeEach` | Shared state leaks between tests | `orders.test.ts:55–72` |

### Summary
- **Verdict:** Pass / Needs changes / Block
- **Pyramid note:** [Jest vs Playwright justification if relevant]
```

## Output template — TH

```markdown
## Scrutinize: [file หรือ PR]
### ผลตรวจ
| อะไรที่ต้องเปลี่ยน | ทำไม | หลักฐาน |
|-------------------|------|---------|
| เปลี่ยน `toHaveBeenCalledWith` เป็น assert บน return value | Oracle ตรวจ implementation ไม่ใช่ contract | `auth.test.ts:42` |
| เพิ่ม `await` ก่อน `page.click` | Race condition — element อาจยังไม่พร้อม | `checkout.spec.ts:18` |
| ย้าย API setup ไป `beforeEach` | Shared state รั่วระหว่าง test | `orders.test.ts:55–72` |

### สรุป
- **Verdict:** Pass / ต้องแก้ / Block
- **หมายเหตุ pyramid:** [เหตุผล Jest vs Playwright ถ้าเกี่ยวข้อง]
```

## When NOT to use / เมื่อไม่ใช้

- EN: No test code yet — use `test-spec` to design cases, then `jest-patterns` or `playwright-patterns` to implement.
- TH: ยังไม่มี test code — ใช้ `test-spec` ออกแบบ case แล้วใช้ `jest-patterns` หรือ `playwright-patterns` เขียน test

## Cross-references

- Jest specifics → `jest-patterns`
- Playwright specifics → `playwright-patterns`
- Used by: `pr-test-gate`
