#!/bin/bash
/sbin/service slapd start
ldapadd -x -D "cn=Manager,dc=gzinspqc,dc=sicpa-greenzone,dc=com" -w gzinspqc -f /etc/openldap/base.ldif
/sbin/service slapd restart
echo "OpenLdap server starting. Now following slapd log."
echo "=================================================="
tail -f -n +0 /var/lib/ldap/log/gzinspqc.log

# Use docker logs to see the output of the file above.

