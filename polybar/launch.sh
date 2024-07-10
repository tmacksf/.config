#!/usr/bin/env bash

killall -q polybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log
polybar bar 2>&1 | tee -a /tmp/polybar1.log & disown

echo "Bar launched..."
