#!/usr/bin/env bash
set -euo pipefail
kind=$1
stage=/tmp/interval-refactor/embedded-qualification
. /tmp/interval-refactor/tools/export-esp.sh
cd "/mnt/development/alumina-embedded-$kind"
for board in mks-esp32-foc-v1 mks-tinybee mks-tinybee-4mb t-deck-pro t-lora-pager; do
  cargo +1.88.0 run --locked -p xtask -- build --board "$board" --profile release > "$stage/$kind-$board-build.log" 2>&1
  printf '%s %s complete\n' "$kind" "$board"
done
