#!/bin/bash

export DISPLAY=:$(cat /tmp/$1/.Xdisplaynum | tr -d '\n')
xfce4-session --disable-tcp &
export XFCEPID=$!
echo $XFCEPID > /tmp/$1/xfcepid
wait $XFCEPID
kill -s INT $(cat /tmp/$INSTANCE_ID/runscript.pid)
