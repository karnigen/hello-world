#!/usr/bin/env bash

set -e
set -x

# workflow
WF=build-windows64.yml

# branch
#BR=kgn/compile
BR=`git rev-parse --abbrev-ref HEAD`


gh run list --json databaseId --limit 5000 | jq -r '.[].databaseId' 
#gh run list --workflow $WF --json databaseId --limit 5000 | jq -r '.[].databaseId' 



