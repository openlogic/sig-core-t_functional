#!/bin/bash
# Author: Athmane Madjoudj <athmanem@gmail.com>

# 250207 - ip_tables kernel module not loaded by default so attempt to load it before verifying that it's loaded - Rich Alloway <ralloway@perforce.com>

t_Log "Running $0 - check if iptables kernel modules are loaded"

if [ "$centos_ver" -ge 7 ];then
 t_Log "CentOS $centos_ver uses firewalld and not iptables -> SKIP"
 t_CheckExitStatus 0
 exit 0
fi

# Load ip_tables module - RDA - 250207
modprobe ip_tables

lsmod | grep "ip_tables" > /dev/null 2>&1

t_CheckExitStatus $?

