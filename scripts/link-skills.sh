#!/usr/bin/env bash
set -euo pipefail

# Links shippable skills to ~/.cursor/skills or ~/.claude/skills.

REPO="$(cd "$(dirname "$0")/.." && pwd)"
TARGET="${1:-cursor}"

case "$TARGET" in
  cursor) DEST="$HOME/.cursor/skills" ;;
  claude) DEST="$HOME/.claude/skills" ;;
  *)
    echo "usage: $0 [cursor|claude]" >&2
    exit 1
    ;;
esac

if [ -L "$DEST" ]; then
  resolved="$(readlink -f "$DEST" 2>/dev/null || readlink "$DEST")"
  case "$resolved" in
    "$REPO"|"$REPO"/*)
      echo "error: $DEST is a symlink into this repo ($resolved)." >&2
      echo "Remove it and re-run; the script will recreate it as a real dir." >&2
      exit 1
      ;;
  esac
fi

mkdir -p "$DEST"

find "$REPO/skills" -name SKILL.md \
  -not -path '*/node_modules/*' \
  -not -path '*/deprecated/*' \
  -not -path '*/in-progress/*' \
  -not -path '*/personal/*' \
  -print0 |
while IFS= read -r -d '' skill_md; do
  src="$(dirname "$skill_md")"
  name="$(basename "$src")"
  target="$DEST/$name"

  if [ -e "$target" ] && [ ! -L "$target" ]; then
    rm -rf "$target"
  fi

  ln -sfn "$src" "$target"
  echo "linked $name -> $src"
done

echo "done: skills linked to $DEST"
