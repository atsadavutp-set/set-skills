# set-skills

Agent skills for **Software Engineers in Test (SET/QA/Test)**. Bilingual **EN/TH** — agents respond in the user's language.

Inspired by [9arm-skills](https://github.com/thananon/9arm-skills).

## Layout

```
skills/
├── engineering/    # Planning, handoff, debug, review
├── productivity/   # Release, triage, communication
├── frameworks/     # Jest (primary), Playwright, Robot, manual
└── misc/           # Flags, env, debt audit, escalation
```

**Tech stack priority:** Jest → Playwright → Robot Framework → Manual

## Install

### Cursor (recommended)

```bash
git clone <your-repo-url>/set-skills.git
cd set-skills
./scripts/link-skills.sh cursor
```

Skills symlink to `~/.cursor/skills/`.

### Claude Code

```bash
./scripts/link-skills.sh claude
```

### List & validate

```bash
./scripts/list-skills.sh
./scripts/validate-skills.sh   # full bilingual check (trigger, mantra, template, refuse, examples)
```

## Pipeline

```
story-refinement → test-plan → test-spec → test-data-blueprint
  → jest-patterns / playwright-patterns
  → pr-test-gate → regression-scope → run-report
  → release-readiness → qa-status-talk
```

## Reference

### Engineering — Planning & handoff

| Skill | Description |
|-------|-------------|
| **[story-refinement](./skills/engineering/story-refinement/SKILL.md)** | SET refinement — testable AC, gaps, questions / รีไฟน์ story |
| **[test-plan](./skills/engineering/test-plan/SKILL.md)** | Risk-based test plan, Jest-first / แผน test |
| **[test-spec](./skills/engineering/test-spec/SKILL.md)** | Detailed test cases, spec only / สเปค test case |
| **[test-data-blueprint](./skills/engineering/test-data-blueprint/SKILL.md)** | Test data strategy / แผน test data |
| **[dev-handoff](./skills/engineering/dev-handoff/SKILL.md)** | Verify build before test / รับมอบจาก dev |
| **[pr-test-gate](./skills/engineering/pr-test-gate/SKILL.md)** | PR test sign-off / ตรวจ test ก่อน merge |
| **[regression-scope](./skills/engineering/regression-scope/SKILL.md)** | Select suites to run / เลือก regression |
| **[run-report](./skills/engineering/run-report/SKILL.md)** | Summarize test results / สรุปผลรัน test |

### Engineering — Debug & review

| Skill | Description |
|-------|-------------|
| **[test-mantra](./skills/engineering/test-mantra/SKILL.md)** | Reproduce → isolate → classify → verify / มนตรา test |
| **[ci-pipeline-triage](./skills/engineering/ci-pipeline-triage/SKILL.md)** | Pipeline vs test failures / แยก CI pipeline |
| **[scrutinize-tests](./skills/engineering/scrutinize-tests/SKILL.md)** | Jest-first test review / รีวิว test |
| **[defect-report](./skills/engineering/defect-report/SKILL.md)** | Canonical bug report / รายงาน bug |
| **[flaky-hunt](./skills/engineering/flaky-hunt/SKILL.md)** | Flaky investigation / ล่า flaky |

### Productivity

| Skill | Description |
|-------|-------------|
| **[bug-triage](./skills/productivity/bug-triage/SKILL.md)** | Triage bug queue / จัดคิว bug |
| **[smoke-suite](./skills/productivity/smoke-suite/SKILL.md)** | Post-deploy smoke / smoke test |
| **[escaped-defect](./skills/productivity/escaped-defect/SKILL.md)** | Escaped bug analysis / bug หลุด |
| **[release-readiness](./skills/productivity/release-readiness/SKILL.md)** | Go/No-Go / ความพร้อม release |
| **[qa-status-talk](./skills/productivity/qa-status-talk/SKILL.md)** | Status for PM/EM / สื่อสาร QA |
| **[session-debrief](./skills/productivity/session-debrief/SKILL.md)** | After exploratory / สรุป session |

### Frameworks

| Skill | Description |
|-------|-------------|
| **[jest-patterns](./skills/frameworks/jest-patterns/SKILL.md)** | Jest write + review (primary) / Jest หลัก |
| **[playwright-patterns](./skills/frameworks/playwright-patterns/SKILL.md)** | Playwright e2e (secondary) / Playwright รอง |
| **[robot-patterns](./skills/frameworks/robot-patterns/SKILL.md)** | Robot Framework legacy |
| **[exploratory-charter](./skills/frameworks/exploratory-charter/SKILL.md)** | Manual session charter |

### Misc

| Skill | Description |
|-------|-------------|
| **[feature-flag-test](./skills/misc/feature-flag-test/SKILL.md)** | Flag on/off/rollout |
| **[test-debt-audit](./skills/misc/test-debt-audit/SKILL.md)** | Suite health audit |
| **[env-readiness](./skills/misc/env-readiness/SKILL.md)** | Environment checklist |
| **[blocker-escalate](./skills/misc/blocker-escalate/SKILL.md)** | Escalate blockers |

## External skills

Reuse **[post-mortem](https://github.com/thananon/9arm-skills)** from 9arm-skills for deep RCA after validated fixes.

## Bilingual

Every skill includes EN/TH mantras, output templates, and trigger keywords. See [SKILL.template.md](./SKILL.template.md) and [CLAUDE.md](./CLAUDE.md).
