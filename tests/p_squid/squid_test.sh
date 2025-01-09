#!/bin/sh
# Author: Athmane Madjoudj <athmanem@gmail.com>

# 250109 - Change CHECK_FOR after 241213 due to www.centos.org redesign - Rich Alloway <ralloway@perforce.com>
# 250109 - Fix SSL cert matching for EL6/EL7 - Rich Alloway <ralloway@perforce.com>

t_Log "Running $0 - Squid test."

if [ $SKIP_QA_HARNESS -eq 1 ]; then
  URL="http://www.centos.org/"
  #CHECK_FOR="timestamp"	# Before 241213: https://web.archive.org/web/20241212132650/https://www.centos.org/ - RDA - 250109
  CHECK_FOR="CentOS Project"	# After 241213 : https://web.archive.org/web/20241213163833/https://www.centos.org/ - RDA - 250109
else
  URL="http://repo.centos.qa/qa/"
  CHECK_FOR="ks_cfg"
fi

# CentOS 6/7 lynx doesn't like that the SSL cert for https://www.centos.org uses Common Name "centos.org" - RDA - 250109
if [ "$centos_ver" -le "7" ]; then
  URL="https://centos.org/"
fi

squidclient -T 2 ${URL} | grep "${CHECK_FOR}"  >/dev/null 2>&1

t_CheckExitStatus $?
