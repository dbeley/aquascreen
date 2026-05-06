#!/usr/bin/env bash
DIR="$(cd "$(dirname "$0")" && pwd)"
PARAMS=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --bg) PARAMS+="bg=$2&"; shift 2 ;;
    --density) PARAMS+="density=$2&"; shift 2 ;;
    --palette) PARAMS+="palette=$2&"; shift 2 ;;
    --species) PARAMS+="species=$2&"; shift 2 ;;
    --pixel-scale) PARAMS+="pixelScale=$2&"; shift 2 ;;
    --speed) PARAMS+="speed=$2&"; shift 2 ;;
    --fps) PARAMS+="fps=$2&"; shift 2 ;;
    --seed) PARAMS+="seed=$2&"; shift 2 ;;
    --help) PARAMS="help=1"; shift ;;
    *) shift ;;
  esac
done

PARAMS="${PARAMS%&}"
exec chromium --kiosk --noerrdialogs --disable-infobars \
  "file://$DIR/index.html${PARAMS:+?$PARAMS}"
