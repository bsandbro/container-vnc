#!/bin/bash

export DISPLAY=:$(cat /TMPDIR/.Xdisplaynum | tr -d '\n')
dbus-launch --exit-with-session xfce4-session --disable-tcp &
export XFCEPID=$!
echo $XFCEPID > /TMPDIR/xfcepid
wait $XFCEPID
kill -s INT $(cat /TMPDIR/runscript.pid)
