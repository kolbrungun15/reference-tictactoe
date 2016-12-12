#!/bin/bash
set -e #stoppar strax ef villa kemur upp	

sleep 10 #stoppar scriptuna í 10 sek á meðan dockerfile er að vinna
npm run migratedb-prod
node run.js

exit 0