#!/bin/bash

# Start Cron service
service cron start
service cron status

# Start FCGI server
echo "Starting FCGI IIpsrv"
spawn-fcgi -f src/iipsrv.fcgi -p 9000

# Create and tail log file
touch $LOGFILE
tail -f $LOGFILE
