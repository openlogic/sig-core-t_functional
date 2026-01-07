#!/bin/bash
# Author: Athmane Madjoudj <athmanem@gmail.com>

t_Log "Running $0 - installing vsFTPd."
t_InstallPackage vsftpd
if [ "$centos_ver" -ge 8 ] ; then

# Disable IPv6 since not all CentOS 8 vagrant boxes support IPv6 - RDA - 260107
sed -i -e 's/^listen=NO/listen=YES/g' -e 's/^listen_ipv6=YES/listen_ipv6=NO/g' /etc/vsftpd/vsftpd.conf

cp -fp /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.conf.tf_p_vsftpd
sed -i 's/anonymous_enable=NO/anonymous_enable=YES/g' /etc/vsftpd/vsftpd.conf
fi
t_ServiceControl vsftpd restart
if [ "$centos_ver" -ge 8 ] ; then
mv -f /etc/vsftpd/vsftpd.conf.tf_p_vsftpd /etc/vsftpd/vsftpd.conf
fi
