#!/bin/sh

set -eu

VERSION=2.1.5
INSTALLDIR=/usr/local/etc/ubooquity
WORKDIR=/var/db/ubooquity

USERNAME=ubooquity
GROUPNAME="$USERNAME"

# Create user and group
pw groupadd -n "$GROUPNAME"
pw useradd -n "$USERNAME" -g "$GROUPNAME" -w no -s ""

# Download Ubooquity
UBQ="Ubooquity-${VERSION}.zip"
fetch -o /tmp http://vaemendis.net/ubooquity/downloads/"${UBQ}"

# Install Ubooquity
install -d -m 770 -o "$USERNAME" -g "$GROUPNAME" "$WORKDIR"
install -d -m 555 -o "$USERNAME" -g "$GROUPNAME" "$INSTALLDIR"
unzip -o -d "$INSTALLDIR" /tmp/"$UBQ"
chown -R "$USERNAME":"$GROUPNAME" "$INSTALLDIR"

# Enable Ubooquity
sysrc -f /etc/rc.conf ubooquity_enable="YES"
sysrc -f /etc/rc.conf ubooquity_username="$USERNAME"
sysrc -f /etc/rc.conf ubooquity_workdir="$WORKDIR"
sysrc -f /etc/rc.conf ubooquity_library_port=42202
sysrc -f /etc/rc.conf ubooquity_admin_port=42203

# Start Ubooquity
service ubooquity start
