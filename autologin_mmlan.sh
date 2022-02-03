#!/usr/bin/env bash

set -Eeuo pipefail

cd `dirname $0`

eval $(egrep -v '^#' .env | xargs)

SSID=`/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I | awk '/ SSID:/ {print $2}'`

if [ "${SSID}" = "mm2020" ] || [ "${SSID}" = "mm2010" ]; then
    LOGIN_URL=`curl -w "%{redirect_url}" -s -o /dev/null http://www.naist.jp`
    curl ${LOGIN_URL} -d "RequestType=Login" -d "UE-Username=${UE_USERNAME}" -d "UE-Password=${UE_PASSWORD}"
fi
