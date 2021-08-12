#!/bin/bash

export DISPLAY=:"$(tr -d '\n' < /TMPDIR/.Xdisplaynum)"
dbus-launch --exit-with-session xfce4-session --disable-tcp &
XFCEPID=$!
echo $XFCEPID > /TMPDIR/xfcepid
wait $XFCEPID
kill -s INT "$(cat /TMPDIR/runscript.pid)"
