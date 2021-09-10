#!/bin/sh

# 30mins, and notify 30sec before.

exec xautolock -detectsleep \
  -time 30 -locker "i3lock -c 004000" \
  -notify 30 \
  -notifier "notify-send -u critical -t 10000 -- 'LOCKING screen in 30 seconds'"
