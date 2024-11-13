#!/bin/bash
# Author: Athmane Madjoudj <athmanem@gmail.com>

t_Log "Running $0 - remove unused MTAs and install postfix"

# Remove other MTAs
t_ServiceControl sendmail stop
t_ServiceControl exim stop
sleep 3
t_RemovePackage sendmail exim

# Postfix
t_InstallPackage postfix nc rsyslog

# Disable IPv6 - Rich Alloway <ralloway@perforce.com>
sed -i -e 's/^inet_protocols.*$/inet_protocols = ipv4/g' /etc/postfix/main.cf

t_ServiceControl postfix start
t_ServiceControl rsyslog start

