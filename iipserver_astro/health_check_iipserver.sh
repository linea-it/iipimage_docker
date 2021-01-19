#!/bin/bash

DATENOW=`date +%Y%m%d-%H%M%S`
LOG_FILE="/var/log/health_check_iipserver.log"
count=1

echo "-------------------------------------------" >> $LOG_FILE
echo "$DATENOW [INFO]  Start Health Check" >> $LOG_FILE

while read url;
do
    urlstatus=$(/usr/bin/curl -H 'Cache-Control: no-cache' -o /dev/null --silent --head --write-out '%{http_code}' "$url" )

    if [ "$urlstatus" = "200" ]
        then
            echo "$DATENOW [INFO]  URL $count Status: $urlstatus" >> $LOG_FILE

    else
        # Corta a ulr no & tirando os parametros, dessa forma a url fica mais legivel no log.
        shorturl=$(cut -d'&' -f1 <<<"$url")
        echo "$DATENOW [ERROR] URL $count Status: $urlstatus  [$shorturl]" >> $LOG_FILE

        # TODO: Talvez fosse interessante enviar um email informando o restart.
        
        exit 1
    fi
    let count++
done < $1



