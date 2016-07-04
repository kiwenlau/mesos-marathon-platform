#!/bin/bash

echo -e "\nrun nginx on mesos/marathon platform\n"

curl -Ss \
     -X POST \
     -H "Content-Type: application/json" \
     --data "@nginx.json" \
     http://127.0.0.1:8080/v2/apps | python2.7 -mjson.tool

echo ""

