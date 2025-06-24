#!/bin/bash libreria apposita

WATCH_DIR="/opt/splunk"  # o qualsiasi dir vuoi monitorare

cd "$WATCH_DIR"

inotifywait -mrq -e modify,create,delete,move . |
while read path action file; do
    git add -A
    git commit -m "Auto-commit: $action $file"
    git push origin master
done
