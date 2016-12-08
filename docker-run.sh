#!/bin/bash
set -e

sleep 10
npm run migradedb
node run.js

exit 0