#!/bin/sh
# Tells Finger Skate a Claude Code session is working or idle ($1), with the session id from the hook's JSON input.
# Never prints anything (a prompt hook's output would reach Claude) and never fails.
{
    # The first "session_id" field, and only a plain id (letters, digits, - and _).
    id=$(grep -o '"session_id" *: *"[A-Za-z0-9_-]*"' | head -n 1 | sed 's/.*"\([A-Za-z0-9_-]*\)"$/\1/')
    case "$id" in ''|*[!A-Za-z0-9_-]*) id=unknown;; esac
    case "$1" in
        working) open -g "fingerskate://claude/working?session=$id" ;;
        # Done: no need to launch the game for that.
        idle) pgrep -xq FingerSkate && open -g "fingerskate://claude/idle?session=$id" ;;
    esac
} >/dev/null 2>&1
exit 0
