---
name: test-data-blueprint
description: >
  Test data strategy from test spec — sources, ownership, isolation, cleanup.
  Trigger EN: /test-data-blueprint, test data, seed data, fixtures, data setup.
  Trigger TH: /test-data-blueprint, test data, ข้อมูลทดสอบ, seed data, เตรียม data.
---

# Test Data Blueprint / แผน Test Data

Design test data strategy. `test-spec` lists per-case data; this skill owns the overall approach.

## Language / ภาษา

Detect the user's language from their latest message.

- User writes Thai → respond entirely in Thai (mantra, steps, output).
- User writes English → respond entirely in English.
- Mixed → use the dominant language; if unclear, ask once.
- Always keep: code, file paths, Jira keys, framework names in original form.

## Recite verbatim — EN

> **Mantra:**
> 1. **No prod data** — never copy real PII into test.
> 2. **Idempotent runs** — same data setup, same result every time.
> 3. **Parallel-safe** — cases must not stomp each other's data.
> 4. **Cleanup is planned** — not an afterthought.

## ท่อง verbatim — TH

> **มนตรา:**
> 1. **ห้ามใช้ prod data** — ไม่ copy PII จริงมา test
> 2. **รันซ้ำได้ผลเดิม** — setup เดิม ผลเดิม
> 3. **ปลอดภัยต่อ parallel** — case ไม่ทับ data กัน
> 4. **วางแผน cleanup** — ไม่ใช่ทำทีหลัง

Then begin work.

## Workflow (execute in order)

1. Extract data requirements from test spec / ดึง data จาก spec
2. Group by strategy — fixture, factory, API seed, DB seed, mock / จัดกลุ่ม
3. Assign ownership — SET, dev endpoint, shared staging / กำหนด owner
4. Plan isolation for parallel / CI matrix / วางแผน isolation
5. Define cleanup and idempotency / cleanup และ idempotency
6. Flag PII and sensitive data rules / กฎ PII

## Required inputs — refuse without these

- [ ] `test-spec` with data needs per case (or test plan with data section)

## Output template — EN

```markdown
## Test Data Blueprint: [STORY-KEY]
| Data Entity | Used By (TC-IDs) | Source | Creator | Cleanup | Parallel Safe | Notes |
### Rules
- No prod PII: [...]
- Seed command / API: [...]
```

## Output template — TH

```markdown
## แผน Test Data: [STORY-KEY]
| Data Entity | TC-IDs | แหล่ง | ผู้สร้าง | Cleanup | Parallel ปลอดภัย | หมายเหตุ |
### กฎ
- ห้าม PII prod: [...]
- คำสั่ง seed / API: [...]
```

## When NOT to use / เมื่อไม่ใช้

- EN: No test spec yet — use `test-spec` first.
- TH: ยังไม่มี test spec — ใช้ `test-spec` ก่อน

## Cross-references

- Input from: `test-spec`
- Output to: `jest-patterns`, `playwright-patterns`, `env-readiness`
