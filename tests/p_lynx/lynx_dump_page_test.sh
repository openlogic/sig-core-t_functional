#!/bin/sh
# Author: Athmane Madjoudj <athmanem@gmail.com>

# Change CHECK_FOR after 241213 due to www.centos.org redesign - Rich Alloway <ralloway@perforce.com>

t_Log "Running $0 - check that lynx can dump remote page."

if [ "$centos_ver" -ge "8" ]; then
  t_Log "Package lynx not available in default repos on c8 => SKIP"
  exit 0
fi


if [ "$SKIP_QA_HARNESS" = "1" ] ; then
  URL="http://www.centos.org/"
  #CHECK_FOR="timestamp"	# Before 241213: https://web.archive.org/web/20241212132650/https://www.centos.org/ - RDA - 241216
  CHECK_FOR="CentOS Project"	# After 241213 : https://web.archive.org/web/20241213163833/https://www.centos.org/ - RDA - 241216
else
  URL="http://repo.centos.qa/qa/"
  CHECK_FOR="ks_cfg"
fi

lynx -dump ${URL} | grep "${CHECK_FOR}"  >/dev/null 2>&1

t_CheckExitStatus $?
