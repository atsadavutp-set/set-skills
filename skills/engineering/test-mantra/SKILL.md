---
name: test-mantra
description: >
  Four-mantra SET discipline — reproduce, isolate, classify, verify fix.
  Trigger EN: /test-mantra, test fail, CI red, flaky, debug test, investigate failure.
  Trigger TH: /test-mantra, test พัง, CI แดง, test ไม่ผ่าน, ช่วยดู test, flaky, debug test.
---

# Test Mantra / มนตรา Test

Four-step discipline for any test failure or bug investigation.

## Language / ภาษา

Detect the user's language from their latest message.

- User writes Thai → respond entirely in Thai (mantra, steps, output).
- User writes English → respond entirely in English.
- Mixed → use the dominant language; if unclear, ask once.
- Always keep: code, file paths, Jira keys, framework names in original form.

## Recite verbatim — EN

> **Mantra:**
> 1. **Reproduce first** — can it fail reliably? In which env?
> 2. **Isolate the variable** — data, env, timing, order, shared state?
> 3. **Classify the failure** — product bug / test bug / env / flake / data?
> 4. **Verify the fix closes the gap** — does the fix break anything else?

## ท่อง verbatim — TH

> **มนตรา:**
> 1. **Reproduce ก่อน** — fail ซ้ำได้ไหม? ใน env ไหน?
> 2. **Isolate ตัวแปร** — data, env, timing, order, shared state?
> 3. **จำแนก failure** — product bug / test bug / env / flake / data?
> 4. **Verify fix ปิดช่องว่าง** — แก้แล้วพังจุดอื่นไหม?

Then begin work.

## Workflow (execute in order)

1. **Reproduce** — minimal steps, capture logs/screenshots / ทำให้เกิดซ้ำ
2. **Isolate** — change one variable at a time / เปลี่ยนทีละตัวแปร
3. **Classify** — pick one category with evidence / จำแนกพร้อมหลักฐาน
4. **Verify** — after fix, rerun repro + adjacent tests / ยืนยันหลังแก้

## Required inputs — refuse without these

- [ ] Error message, log snippet, or failing test name

## Output template — EN

```markdown
## Test Investigation: [test-name / bug-id]
- **Repro:** [steps + env]
- **Isolated variable:** [...]
- **Classification:** product / test / env / flake / data
- **Evidence:** [...]
- **Next action:** fix product / fix test / flaky-hunt / escalate
```

## Output template — TH

```markdown
## การสืบค้น Test: [test-name / bug-id]
- **Repro:** [ขั้นตอน + env]
- **ตัวแปรที่ isolate:** [...]
- **ประเภท:** product / test / env / flake / data
- **หลักฐาน:** [...]
- **ขั้นถัดไป:** แก้ product / แก้ test / flaky-hunt / escalate
```

## When NOT to use / เมื่อไม่ใช้

- EN: Pipeline failed before the test stage — use `ci-pipeline-triage`.
- TH: Pipeline fail ก่อนถึง test stage — ใช้ `ci-pipeline-triage`

## Cross-references

- Flake suspected → `flaky-hunt`
- Bug confirmed → `defect-report`
- Pipeline failed before tests → `ci-pipeline-triage`
