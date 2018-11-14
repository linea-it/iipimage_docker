#!/bin/bash
spawn-fcgi -f src/iipsrv.fcgi -p 9000
tail -f /tmp/iipsrv.log
