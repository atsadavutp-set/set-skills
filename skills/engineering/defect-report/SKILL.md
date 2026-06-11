---
name: defect-report
description: >
  Canonical bug report — repro, evidence, severity justification, regression scope.
  Trigger EN: /defect-report, bug report, file bug, write issue, defect ticket.
  Trigger TH: /defect-report, เขียน bug report, รายงาน bug, เปิด bug, defect.
---

# Defect Report / รายงาน Bug

Jira/GitLab-ready bug report. Use after `test-mantra` confirms a product bug.

## Language / ภาษา

Detect the user's language from their latest message.

- User writes Thai → respond entirely in Thai (mantra, steps, output).
- User writes English → respond entirely in English.
- Mixed → use the dominant language; if unclear, ask once.
- Always keep: code, file paths, Jira keys, framework names in original form.

## Recite verbatim — EN

> **Mantra:**
> 1. **Minimal repro** — fewest steps to fail.
> 2. **Expected vs actual** — both stated clearly.
> 3. **Evidence attached** — screenshot, log, trace, video.
> 4. **Severity earned** — justify impact, not just "High."

## ท่อง verbatim — TH

> **มนตรา:**
> 1. **Repro สั้นสุด** — ขั้นตอนน้อยที่สุดที่ fail
> 2. **Expected vs actual ชัด** — ทั้งคู่ต้องมี
> 3. **แนบหลักฐาน** — screenshot, log, trace, video
> 4. **Severity มีเหตุผล** — อธิบาย impact ไม่ใช่แค่ "High"

Then begin work.

## Required inputs — refuse without these

- [ ] Repro steps (or refuse and list what's missing)
- [ ] Expected vs actual
- [ ] Environment (browser/OS/build/branch/env)

## Output template — EN

```markdown
## [Title: action — expected vs actual]
**Environment:** [...]
**Severity:** [level] — [justification]
**Regression scope:** [affected features]
### Steps to reproduce
1. ...
### Expected
...
### Actual
...
### Evidence
[links / attachments]
```

## Output template — TH

```markdown
## [หัวข้อ: action — expected vs actual]
**Environment:** [...]
**Severity:** [ระดับ] — [เหตุผล]
**Regression scope:** [feature ที่เสี่ยง]
### ขั้นตอน repro
1. ...
### ผลที่คาดหวัง
...
### ผลจริง
...
### หลักฐาน
[ลิงก์ / ไฟล์แนบ]
```

## When NOT to use / เมื่อไม่ใช้

- EN: Bug not reproduced or not confirmed as product defect — use `test-mantra` first; suspected duplicate — use `bug-triage`.
- TH: ยัง reproduce ไม่ได้หรือยังไม่ยืนยัน product bug — ใช้ `test-mantra` ก่อน; สงสัย duplicate — ใช้ `bug-triage`

## Cross-references

- Input from: `test-mantra`, `bug-triage`, `session-debrief`
- Output to: `qa-status-talk`
