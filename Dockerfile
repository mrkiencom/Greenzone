FROM centos:6
MAINTAINER Nuno Santos <nuno.santos@sicpa.com>

# Configure the SICPA proxy
#ENV http_proxy http://10.2.64.3:3128/
#ENV https_proxy http://10.2.64.3:3128/
#ENV HTTP_PROXY http://10.2.64.3:3128/
#ENV HTTPS_PROXY http://10.2.64.3:3128/
#
# Expose ldap default port
EXPOSE 389

# Set the default command to run when starting the container
CMD ["/tmp/start.sh"]

# TODO: add all files using a tar ball. That will speedup building the image by reducing the number of layers on the image.
# Add OpenLdap configuration and schema
# COPY valmont-ldap/slapd.d /etc/openldap/slapd.d
# COPY valmont-ldap/DB_CONFIG /var/lib/ldap/valmont/
COPY gzinspqc-ldap/slapd.d /etc/openldap/slapd.d
COPY gzinspqc-ldap/base.ldif /etc/openldap/base.ldif
COPY gzinspqc-ldap/DB_CONFIG /var/lib/ldap/gzinspqc/

# Initializing scripts to be run inside the image.
COPY scripts/ /tmp/

# Set the permissions of the files copied above and install the OpenLdap schema
RUN bash /tmp/setupImage.sh
