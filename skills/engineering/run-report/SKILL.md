---
name: run-report
description: >
  Summarize test run results — group failures, prioritize P0, recommend next actions.
  Trigger EN: /run-report, test results, summarize failures, CI results, 50 tests failed.
  Trigger TH: /run-report, สรุปผล test, ผลการรัน test, test fail เยอะ, สรุป CI.
---

# Run Report / รายงานผลการรัน Test

Turn raw test output into actionable summary.

## Language / ภาษา

Detect the user's language from their latest message.

- User writes Thai → respond entirely in Thai (mantra, steps, output).
- User writes English → respond entirely in English.
- Mixed → use the dominant language; if unclear, ask once.
- Always keep: code, file paths, Jira keys, framework names in original form.

## Recite verbatim — EN

> **Mantra:**
> 1. **New failures first** — what broke since last green?
> 2. **P0 before P2** — prioritize by risk not count.
> 3. **Classify before fixing** — product, test, env, flaky.
> 4. **One clear next step** — per failure group.

## ท่อง verbatim — TH

> **มนตรา:**
> 1. **fail ใหม่ก่อน** — อะไรพังตั้งแต่ green ล่าสุด
> 2. **P0 ก่อน P2** — เรียงตาม risk ไม่ใช่จำนวน
> 3. **จำแนกก่อนแก้** — product, test, env, flaky
> 4. **ขั้นถัดไปชัด** — ต่อกลุ่ม failure

Then begin work.

## Workflow (execute in order)

1. Parse totals — pass, fail, skip, flaky / สรุปตัวเลข
2. Group failures — new vs known/flaky vs env / จัดกลุ่ม
3. Highlight P0 failures first / ไฮไลท์ P0
4. Map to TC-ID, story, owner if known / map ownership
5. Recommend next action per group / แนะนำขั้นถัดไป

## Required inputs — refuse without these

- [ ] Test run output, CI link, or failure list

## Output template — EN

```markdown
## Test Run Report: [run-id / date]
- **Total:** / **Pass:** / **Fail:** / **Skip:** / **Flaky:**
### New failures (action required)
| Test | Classification | Priority | Owner | Next |
### Known failures (tracked)
### Env failures (re-run)
### Recommended next steps
```

## Output template — TH

```markdown
## รายงานผล Test: [run-id / date]
- **รวม:** / **ผ่าน:** / **ไม่ผ่าน:** / **ข้าม:** / **Flaky:**
### Fail ใหม่ (ต้อง action)
| Test | ประเภท | Priority | Owner | ขั้นถัดไป |
### Fail ที่รู้แล้ว (track)
### Fail จาก env (รันใหม่)
### แนะนำขั้นถัดไป
```

## When NOT to use / เมื่อไม่ใช้

- EN: Single failure needing root-cause investigation — use `test-mantra` first.
- TH: Fail เดียวต้องหา root cause — ใช้ `test-mantra` ก่อน

## Cross-references

- Per failure: `test-mantra`
- Output to: `release-readiness`, `qa-status-talk`
