---
name: pr-test-gate
description: >
  SET sign-off on PR test coverage — AC mapping, DoD, scrutinize-tests lens.
  Trigger EN: /pr-test-gate, PR test review, test coverage PR, check DoD, merge gate.
  Trigger TH: /pr-test-gate, รีวิว test PR, PR test พอไหม, ตรวจ DoD, gate merge.
---

# PR Test Gate / ประตูตรวจ Test บน PR

SET sign-off before merge. Does the PR meet test DoD?

## Language / ภาษา

Detect the user's language from their latest message.

- User writes Thai → respond entirely in Thai (mantra, steps, output).
- User writes English → respond entirely in English.
- Mixed → use the dominant language; if unclear, ask once.
- Always keep: code, file paths, Jira keys, framework names in original form.

## Recite verbatim — EN

> **Mantra:**
> 1. **AC coverage is counted** — every AC maps to a test or explicit gap.
> 2. **P0 needs negative proof** — not just happy paths.
> 3. **Tests are scrutinized** — not just present.
> 4. **Blockers are specific** — dev knows exactly what to fix.

## ท่อง verbatim — TH

> **มนตรา:**
> 1. **นับ AC coverage** — ทุก AC map กับ test หรือ gap ชัด
> 2. **P0 ต้องมี negative** — ไม่ใช่แค่ happy path
> 3. **scrutinize test** — มี test ไม่พอ ต้องดีด้วย
> 4. **blocker ชัดเจน** — dev รู้ว่าต้องแก้อะไร

Then begin work.

## Workflow (execute in order)

1. Read PR description + linked story/AC / อ่าน PR และ AC
2. Map AC → test coverage (Jest / Playwright / manual) / map coverage
3. Check DoD — spec cases covered? P0 negatives? / ตรวจ DoD
4. Apply `scrutinize-tests` lens on test files in PR / review test code
5. Verdict — Approve / Block with blockers / ตัดสิน

## Required inputs — refuse without these

- [ ] PR link or diff with test files
- [ ] Linked story or acceptance criteria

## Output template — EN

```markdown
## PR Test Gate: [PR-xxx]
- **AC coverage:** X/Y covered
- **Covered by:** [Jest files, Playwright files, manual note]
- **Missing:** [...]
- **Scrutinize findings:** [what / why / evidence]
- **Verdict:** Approve / Block
- **Blockers:** [...]
```

## Output template — TH

```markdown
## PR Test Gate: [PR-xxx]
- **AC coverage:** X/Y
- **ครอบคลุมโดย:** [ไฟล์ Jest, Playwright, manual]
- **ขาด:** [...]
- **ผล scrutinize:** [อะไร / ทำไม / หลักฐาน]
- **Verdict:** Approve / Block
- **Blockers:** [...]
```

## When NOT to use / เมื่อไม่ใช้

- EN: No PR or test diff yet — use `test-plan` or `test-spec` with dev first.
- TH: ยังไม่มี PR หรือ diff test — ใช้ `test-plan` หรือ `test-spec` กับ dev ก่อน

## Cross-references

- Uses: `scrutinize-tests`
- Output to: `regression-scope`
