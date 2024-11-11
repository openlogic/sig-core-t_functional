#!/bin/bash
# Author: Rich Alloway <ralloway@perforce.com>

# Reason: OpenLogic's initial patch against CVE-2018-6954 (systemd-219-78_ol002.el7.9) caused chronyd to not be able to restart [OSD-2384]

[ ${centos_ver} -lt 7 ] && { t_Log "Systemd is part of el since el7, skipping systemd tests..." ; exit ; }

t_Log "Running $0 - Testing that chronyd can restart with the current version of systemd"

if [ "$CONTAINERTEST" -eq "1" ]; then
    t_Log "Running in container -> SKIP"
    exit 0
fi

systemctl restart chronyd 2>&-

t_CheckExitStatus $?
