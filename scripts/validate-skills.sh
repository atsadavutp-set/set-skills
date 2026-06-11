#!/usr/bin/env bash
set -euo pipefail

REPO="$(cd "$(dirname "$0")/.." && pwd)"
ERRORS=0

check_skill() {
  local skill_md="$1"
  local dir
  dir="$(dirname "$skill_md")"
  local name
  name="$(basename "$dir")"

  if ! grep -q "Trigger EN:" "$skill_md"; then
    echo "FAIL $name: missing 'Trigger EN:' in description"
    ERRORS=$((ERRORS + 1))
  fi
  if ! grep -q "Trigger TH:" "$skill_md"; then
    echo "FAIL $name: missing 'Trigger TH:' in description"
    ERRORS=$((ERRORS + 1))
  fi
  if ! grep -q "## Language / ภาษา" "$skill_md"; then
    echo "FAIL $name: missing Language policy section"
    ERRORS=$((ERRORS + 1))
  fi
  if ! grep -q "Mixed" "$skill_md"; then
    echo "FAIL $name: missing Mixed language rule"
    ERRORS=$((ERRORS + 1))
  fi
  if ! grep -q "Recite verbatim — EN" "$skill_md"; then
    echo "FAIL $name: missing EN mantra block"
    ERRORS=$((ERRORS + 1))
  fi
  if ! grep -q "ท่อง verbatim — TH" "$skill_md"; then
    echo "FAIL $name: missing TH mantra block"
    ERRORS=$((ERRORS + 1))
  fi
  if ! grep -q "Output template — EN" "$skill_md"; then
    echo "FAIL $name: missing Output template — EN"
    ERRORS=$((ERRORS + 1))
  fi
  if ! grep -q "Output template — TH" "$skill_md"; then
    echo "FAIL $name: missing Output template — TH"
    ERRORS=$((ERRORS + 1))
  fi
  if ! grep -q "When NOT to use" "$skill_md"; then
    echo "FAIL $name: missing When NOT to use section"
    ERRORS=$((ERRORS + 1))
  fi
  if ! grep -qi "refuse" "$skill_md"; then
    echo "FAIL $name: missing refuse condition"
    ERRORS=$((ERRORS + 1))
  fi
  if [ ! -f "$dir/examples.md" ]; then
    echo "FAIL $name: missing examples.md"
    ERRORS=$((ERRORS + 1))
  fi
  if ! grep -q "## EN" "$dir/examples.md" 2>/dev/null; then
    echo "FAIL $name: examples.md missing EN section"
    ERRORS=$((ERRORS + 1))
  fi
  if ! grep -q "## TH" "$dir/examples.md" 2>/dev/null; then
    echo "FAIL $name: examples.md missing TH section"
    ERRORS=$((ERRORS + 1))
  fi
}

cd "$REPO"
while IFS= read -r skill_md; do
  check_skill "$skill_md"
done < <(find skills -name SKILL.md \
  -not -path '*/deprecated/*' \
  -not -path '*/in-progress/*' \
  -not -path '*/personal/*' | sort)

if [ "$ERRORS" -eq 0 ]; then
  echo "OK: all shippable skills pass full bilingual validation"
  exit 0
else
  echo "FAILED: $ERRORS error(s)"
  exit 1
fi
