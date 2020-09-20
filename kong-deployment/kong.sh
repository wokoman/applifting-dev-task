#!/bin/bash

curl -i -X POST \
  --url http://kong:8001/services/ \
  --data 'name=whoami-kong' \
  --data 'url=http://whoami-kong'

curl -i -X POST \
  --url http://kong:8001/services/whoami-kong/routes \
  --data 'paths[]=/whoami'

curl -X POST http://kong:8001/services/whoami-kong/plugins \
    --data "name=basic-auth"  \
    --data "config.hide_credentials=true"

curl -d "username=lurker&custom_id=0451" http://kong:8001/consumers/

curl -X POST http://kong:8001/consumers/lurker/basic-auth \
    --data "username=applifting" \
    --data "password=${1}"
