#!/bin/bash

if [ "$CREATE_USER_UID" -a "$CREATE_USER_GID" ]; then
    echo "Create 'site-owner' group with GID=$CREATE_USER_GID"
    groupadd -g $CREATE_USER_GID site-owner
    echo "Add '${RUN_AS_USER:-nobody}' user to group 'site-owner'"
    usermod -a -G site-owner ${RUN_AS_USER:-nobody}
    echo "Create 'site-owner' user with UID=$CREATE_USER_UID, GID=$CREATE_USER_GID"
    useradd -d /var/www -g $CREATE_USER_GID -s /bin/false -M -N -u $CREATE_USER_UID site-owner
fi

exec gosu ${RUN_AS_USER:-nobody}:${RUN_AS_GROUP:-nogroup} /usr/lib/iipimage-server/iipsrv.fcgi --bind 0.0.0.0:9000
