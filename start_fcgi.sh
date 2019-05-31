#!/bin/bash
spawn-fcgi -f srv/src/iipsrv.fcgi -p 9000
touch $LOGFILE
tail -f $LOGFILE
