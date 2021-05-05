#!/bin/bash

export DISPLAY=:$(cat /tmp/$1/.Xdisplaynum | tr -d '\n')
HOME="/tmp/$INSTANCE_ID/" dbus-launch --exit-with-session xfce4-session --disable-tcp &
export XFCEPID=$!
echo $XFCEPID > /tmp/$1/xfcepid
wait $XFCEPID
kill -s INT $(cat /tmp/$INSTANCE_ID/runscript.pid)
