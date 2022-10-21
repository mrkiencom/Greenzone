#!/bin/bash
set -e
adduser ldap
yum -y install openldap openldap-servers openldap-clients && \ yum clean all
chown -R ldap:ldap /var/lib/ldap/
chown -R ldap:ldap /etc/openldap/
chmod 0700 -R /etc/openldap/*
mkdir -p /var/lib/ldap/log
chown ldap:ldap /var/lib/ldap/log
chmod 0700 /var/lib/ldap/log/
touch /var/lib/ldap/log/gzinspqc.log
mkdir -p /var/lib/ldap/gzinspqc
chown ldap:ldap /var/lib/ldap/gzinspqc
chmod 0700 /var/lib/ldap/gzinspqc
chown ldap:ldap /var/lib/ldap/gzinspqc/DB_CONFIG
chmod 0600 /var/lib/ldap/gzinspqc/DB_CONFIG
chmod +x /tmp/start.sh

