---
name: dev-handoff
description: >
  Verify dev handoff before testing — build, scope, dependencies, known issues.
  Trigger EN: /dev-handoff, ready for QA, ready for test, handoff, QA can start.
  Trigger TH: /dev-handoff, พร้อม test, QA ได้เลย, ส่งมอบ test, handoff, พร้อมทดสอบ.
---

# Dev Handoff / รับมอบจาก Dev

Verify the build is testable before SET starts execution.

## Language / ภาษา

Detect the user's language from their latest message.

- User writes Thai → respond entirely in Thai (mantra, steps, output).
- User writes English → respond entirely in English.
- Mixed → use the dominant language; if unclear, ask once.
- Always keep: code, file paths, Jira keys, framework names in original form.

## Recite verbatim — EN

> **Mantra:**
> 1. **Build is explicit** — commit, branch, env URL.
> 2. **Scope is explicit** — what's in and out this test round.
> 3. **Dependencies are explicit** — flags, config, migrations, third parties.
> 4. **Known issues are explicit** — no surprise "I knew that."

## ท่อง verbatim — TH

> **มนตรา:**
> 1. **Build ชัด** — commit, branch, env URL
> 2. **Scope ชัด** — in/out ของรอบ test นี้
> 3. **Dependency ชัด** — flag, config, migration, third-party
> 4. **Known issues ชัด** — ไม่ surprise "รู้อยู่แล้ว"

Then begin work.

## Workflow (execute in order)

1. Collect build pointer — PR, branch, deploy URL / เก็บ build
2. Confirm in/out scope vs story AC / ยืนยัน scope
3. List dependencies — feature flags, env vars, DB migrations / รายการ dependency
4. Capture known issues dev acknowledges / known issues
5. Verdict — Green / Yellow / Red + ready for `regression-scope`? / ตัดสิน

## Required inputs — refuse without these

- [ ] PR link, build URL, or deploy environment
- [ ] Story or change description

## Output template — EN

```markdown
## Dev Handoff: [PR-xxx / STORY-KEY]
- **Status:** Green / Yellow / Red
- **Build:** [branch, commit, env URL]
- **In scope:** [...]
- **Out of scope:** [...]
- **Dependencies:** [...]
- **Known issues:** [...]
- **Missing for test:** [...]
- **Ready for regression-scope:** Yes / No
```

## Output template — TH

```markdown
## รับมอบจาก Dev: [PR-xxx / STORY-KEY]
- **สถานะ:** Green / Yellow / Red
- **Build:** [branch, commit, env URL]
- **ใน scope:** [...]
- **นอก scope:** [...]
- **Dependencies:** [...]
- **Known issues:** [...]
- **สิ่งที่ยังขาด:** [...]
- **พร้อม regression-scope:** ใช่ / ไม่
```

## When NOT to use / เมื่อไม่ใช้

- EN: No build or deploy yet — wait for dev; pre-dev AC gaps → `story-refinement`.
- TH: ยังไม่มี build หรือ deploy — รอ dev; AC ยังไม่ชัดก่อน dev → `story-refinement`

## Cross-references

- Output to: `regression-scope`, `env-readiness`
