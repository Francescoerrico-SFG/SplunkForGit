#!/bin/bash

REPO_PATH="/opt/splunk"
cd "$REPO_PATH" || exit 1

while true; do
    if [ -n "$(git status --porcelain)" ]; then
        echo "Modifiche rilevate, eseguo push..."
        git add .
        git commit -m "Commit automatico $(date '+%Y-%m-%d %H:%M:%S')"
        git push origin master  # o master se usi master
    fi
    sleep 30
done
