#!/bin/bash
set -e

if [ -d /data ]; then
  mkdir -p /data/.openclaw /data/workspace /data/workspace/skills
  chown -R node:node /data
fi

gosu node node openclaw.mjs doctor --fix 2>/dev/null || true

exec gosu node "$@"
