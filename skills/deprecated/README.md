# Deprecated skills / Skills ที่เลิกใช้แล้ว

Skills moved here are **kept for reference** but are **not installed** and **not listed** in the top-level README.

ย้าย skill มาที่นี่เมื่อเลิกใช้แล้ว — เก็บไว้อ้างอิง แต่ **ไม่ติดตั้ง** และ **ไม่แสดง** ใน README หลัก

## When to deprecate / เมื่อไหร่ควร deprecate

- EN: A skill was renamed — move the old folder here with a pointer to the replacement.
- TH: เปลี่ยนชื่อ skill — ย้ายโฟลเดอร์เก่ามาที่นี่ พร้อมชี้ไปตัวใหม่
- EN: Workflow or stack changed (e.g. Robot → Jest-only) and the skill should not be invoked.
- TH: workflow หรือ stack เปลี่ยน (เช่น Robot → Jest อย่างเดียว) และไม่ควรใช้ skill นี้แล้ว
- EN: Merged into another skill — keep one release cycle for migration, then remove.
- TH: รวมเข้า skill อื่นแล้ว — เก็บไว้หนึ่งรอบ release ให้ทีมย้าย แล้วค่อยลบ

## How to deprecate a skill / วิธีย้าย skill เข้ามา

1. Move the skill directory into `skills/deprecated/`:
   ```bash
   git mv skills/engineering/old-skill skills/deprecated/old-skill
   ```
2. At the top of `SKILL.md`, add a deprecation notice (EN + TH):
   ```markdown
   > **Deprecated** — use `new-skill` instead. Reason: [one line].
   > **เลิกใช้แล้ว** — ใช้ `new-skill` แทน เหตุผล: [หนึ่งบรรทัด]
   ```
3. Remove the skill from:
   - [README.md](../../README.md) reference table
   - [.cursor-plugin/plugin.json](../../.cursor-plugin/plugin.json) `skills` array
   - Bucket README if listed (e.g. `skills/engineering/README.md`)
4. Do **not** add deprecated skills to any shippable bucket README.
5. Scripts already skip this folder:
   - `scripts/link-skills.sh`
   - `scripts/list-skills.sh`
   - `scripts/validate-skills.sh`

## What stays here / อะไรอยู่ในโฟลเดอร์นี้

| Item | Ship? |
|------|-------|
| This README only | — |
| Deprecated skill folders (when any) | No |

Currently empty — no skills have been deprecated yet.

ตอนนี้ยังว่าง — ยังไม่มี skill ที่ถูก deprecate

## Removing permanently / ลบถาวร

After the team no longer needs the migration pointer (typically one release cycle):

```bash
git rm -r skills/deprecated/old-skill
```

Prefer deprecate-then-remove over deleting without notice so agents and docs do not reference a missing skill.

ควร deprecate ก่อนลบถาวร เพื่อไม่ให้ agent หรือเอกสารอ้าง skill ที่หายไปโดยไม่มีทางแทน
