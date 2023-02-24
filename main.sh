#!/bin/bash

# check variables
if [[ -z $CF_CLIENT_ID || -z $CF_CLIENT_SECRET || -z $CF_HOSTNAME ]]
then
    echo 'CF_HOSTNAME,CF_CLIENT_ID,CF_CLIENT_SECRET must be set'
    exit 1
fi

# get my ip
myip=$(hostname -i)

# start tunnel
echo "Running access tunnel for $CF_HOSTNAME"
cloudflared access tcp -hostname $CF_HOSTNAME -url $myip:$CF_PORT -id $CF_CLIENT_ID \
-secret $CF_CLIENT_SECRET -loglevel $LOGLEVEL