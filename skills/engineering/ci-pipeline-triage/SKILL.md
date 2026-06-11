---
name: ci-pipeline-triage
description: >
  Triage full CI pipeline failures — install, build, env vs test stage failures.
  Trigger EN: /ci-pipeline-triage, pipeline failed, CI broken, job failed before tests.
  Trigger TH: /ci-pipeline-triage, pipeline พัง, CI แดง, job fail, build fail, pipeline broken.
---

# CI Pipeline Triage / แยกแยะ CI Pipeline

When the pipeline fails before or around tests — not the same as a single test failure.

## Language / ภาษา

Detect the user's language from their latest message.

- User writes Thai → respond entirely in Thai (mantra, steps, output).
- User writes English → respond entirely in English.
- Mixed → use the dominant language; if unclear, ask once.
- Always keep: code, file paths, Jira keys, framework names in original form.

## Recite verbatim — EN

> **Mantra:**
> 1. **Find the failing stage** — not the last log line.
> 2. **Infra is not a test bug** — don't fix tests when npm install failed.
> 3. **Route correctly** — test stage goes to test-mantra.
> 4. **Owner is explicit** — platform, dev, or SET.

## ท่อง verbatim — TH

> **มนตรา:**
> 1. **หา stage ที่ fail** — ไม่ใช่แค่บรรทัดสุดท้าย
> 2. **Infra ไม่ใช่ test bug** — install fail ไม่ใช่แก้ test
> 3. **ส่งต่อถูกทาง** — test stage → test-mantra
> 4. **ระบุ owner ชัด** — platform, dev, หรือ SET

Then begin work.

## Workflow (execute in order)

1. Identify fail stage — checkout / install / build / test / deploy / ระบุ stage
2. Classify — infra / config / dependency / code / test / จำแนก
3. If test stage → hand off to `test-mantra` or `flaky-hunt` / ส่งต่อ test skills
4. If infra → hand off to `blocker-escalate` / ส่ง escalate
5. State owner and next action / owner และขั้นถัดไป

## Required inputs — refuse without these

- [ ] CI job log, pipeline URL, or failed stage name

## Output template — EN

```markdown
## CI Pipeline Triage: [pipeline / job]
- **Failed stage:** [...]
- **Classification:** infra / config / dependency / code / test
- **Evidence:** [log excerpt]
- **Owner:** platform / dev / SET
- **Next action:** [...]
- **Hand off to:** test-mantra / flaky-hunt / blocker-escalate / none
```

## Output template — TH

```markdown
## CI Pipeline Triage: [pipeline / job]
- **Stage ที่ fail:** [...]
- **ประเภท:** infra / config / dependency / code / test
- **หลักฐาน:** [log]
- **Owner:** platform / dev / SET
- **ขั้นถัดไป:** [...]
- **ส่งต่อ:** test-mantra / flaky-hunt / blocker-escalate / ไม่มี
```

## When NOT to use / เมื่อไม่ใช้

- EN: Test stage ran and specific tests failed — use `test-mantra` or `flaky-hunt`.
- TH: Test stage รันแล้วและ fail เฉพาะ test — ใช้ `test-mantra` หรือ `flaky-hunt`

## Cross-references

- Test failures → `test-mantra`, `flaky-hunt`
- Infra blocks → `blocker-escalate`
