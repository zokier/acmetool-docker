#!/bin/sh

ACMETOOL_LOG="/var/log/acmetool_reconcile.log"
env | grep ^HOOK > /etc/acme_reload

while true
do
    anacron -d -S /var/lib/acme/anacron $ANACRON_FLAGS
    if test -f $ACMETOOL_LOG
    then
        cat $ACMETOOL_LOG
        mv $ACMETOOL_LOG $ACMETOOL_LOG.1
    fi
    sleep 86400
done
