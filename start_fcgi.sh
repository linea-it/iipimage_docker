#!/bin/bash
spawn-fcgi -f src/iipsrv.fcgi -p 9000
touch /tmp/iipsrv.log
tail -f /tmp/iipsrv.log
