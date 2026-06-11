---
name: flaky-hunt
description: >
  Investigate flaky tests — confirm rate, bisect cause, fix root not retry.
  Trigger EN: /flaky-hunt, flaky test, passes sometimes, CI retry passed, intermittent fail.
  Trigger TH: /flaky-hunt, test แปลกๆ, flaky, รันบ้างผ่านบ้างไม่, test ไม่เสถียร.
---

# Flaky Hunt / ล่า Flaky Test

Dedicated flaky investigation. Do not mask with retries alone.

## Language / ภาษา

Detect the user's language from their latest message.

- User writes Thai → respond entirely in Thai (mantra, steps, output).
- User writes English → respond entirely in English.
- Mixed → use the dominant language; if unclear, ask once.
- Always keep: code, file paths, Jira keys, framework names in original form.

## Recite verbatim — EN

> **Mantra:**
> 1. **Confirm the flake** — measure pass/fail rate over many runs.
> 2. **Bisect the variable** — serial vs parallel, env, data, order.
> 3. **Fix root cause** — retries are a bandage.
> 4. **Guard the suite** — prevent recurrence.

## ท่อง verbatim — TH

> **มนตรา:**
> 1. **ยืนยัน flake** — วัด pass/fail หลายรอบ
> 2. **แบ่ง bisect ตัวแปร** — serial/parallel, env, data, order
> 3. **แก้ root cause** — retry เป็นแพลสเตอร์
> 4. **กันไม่ให้กลับมา** — ป้องกัน recurrence

Then begin work.

## Workflow (execute in order)

1. Confirm flake — run ≥10 times, record rate / รัน ≥10 ครั้ง
2. Bisect — isolation, parallel, env diff / bisect
3. Categorize root cause:
   - **Jest:** async leak, timer, mock pollution, unseeded random
   - **Playwright:** timing, selector, shared UI state
4. Prescribe fix — product vs test / แนะนำ fix
5. Guard — flake detector in CI if needed / ป้องกัน

## Required inputs — refuse without these

- [ ] Failing test name and recent run history or CI link

## Output template — EN

```markdown
## Flaky Hunt: [test-name]
- **Flake rate:** X/Y runs failed
- **Root cause category:** timing / shared state / order / external dep / data race
- **Evidence:** [...]
- **Recommended fix:** [...]
- **Retry policy:** fix root / do not rely on retry alone
```

## Output template — TH

```markdown
## Flaky Hunt: [test-name]
- **อัตรา flake:** fail X/Y ครั้ง
- **หมวด root cause:** timing / shared state / order / external dep / data race
- **หลักฐาน:** [...]
- **แนะนำแก้:** [...]
- **Retry:** แก้ root / อย่าพึ่ง retry อย่างเดียว
```

## When NOT to use / เมื่อไม่ใช้

- EN: Failure reproduces 100% of the time — use `test-mantra`; pipeline failed before test stage — use `ci-pipeline-triage`.
- TH: Fail ทุกครั้ง (repro 100%) — ใช้ `test-mantra`; pipeline fail ก่อน test stage — ใช้ `ci-pipeline-triage`

## Cross-references

- Input from: `test-mantra`, `ci-pipeline-triage`
- Output to: `release-readiness`, `run-report`
