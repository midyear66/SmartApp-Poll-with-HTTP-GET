#!/bin/bash

RESPONSE=response.txt
HEADERS=headers.txt
URL="https://graph.api.smartthings.com/api/smartapps/installations/<token>/poll/group1?access_token=<token>"
status=000
count=1
# or
#curl -s -D $HEADERS $1 -o $RESPONSE
#status=$(cat $HEADERS | head -n 1 | awk '{print $2}')
while [ $status -ne 200 ] && [ $count -lt 6 ]
do
 status=$(curl -s -w %{http_code} $URL -o $RESPONSE)
 echo $status
 count=`expr $count + 1`
 sleep 3
done
