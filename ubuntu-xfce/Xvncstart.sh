#!/bin/bash

exec 6<> /TMPDIR/.Xdisplaynum

Xvnc -nolisten tcp -rfbunixpath=/TMPDIR/.vncsocket -auth /TMPDIR/.Xauthority -rfbauth /TMPDIR/.vncpasswd -displayfd 6