#!/bin/bash

exec 6<> /tmp/$1/.Xdisplaynum

Xvnc -nolisten tcp -rfbunixpath=/tmp/$1/.vncsocket -auth /tmp/$1/.Xauthority -rfbauth /tmp/$1/.vncpasswd -displayfd 6