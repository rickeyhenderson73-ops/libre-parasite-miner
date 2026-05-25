#!/bin/sh
set -eu

echo "[parasite] Stratum proxy entrypoint starting"

CFG="/config/stratum.conf"

if [ ! -f "$CFG" ]; then
  echo "[parasite] ERROR: stratum.conf not found at $CFG" >&2
  exit 1
fi

echo "[parasite] Loading config from $CFG"
cat "$CFG"

echo "[parasite] Starting Stratum proxy..."

# Run stratum proxy
exec node /app/index.js
