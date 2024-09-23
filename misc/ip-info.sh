#!/usr/bin/env bash

ARG=$@
curl -s http://ip-api.com/json/$ARG?fields=66846719 | jq -r 'to_entries[] | "\u001b[32m\(.key)\u001b[0m: \u001b[34m\(.value)\u001b[0m"'
