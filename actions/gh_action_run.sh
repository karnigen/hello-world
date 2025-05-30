#!/usr/bin/env bash

set -e
set -x

# workflow
WF=build-windows64.yml

# branch
BR=kgn/compile


#gh workflow run $WF -r kgn/pyproject-toml-investigation -f build_type=$build_type
#gh workflow run $WF -r kgn/pyproject-toml-investigation -f build_type=$build_type -f break_on=$break_on

git commit -a -m "Automated: Build"
#git push

#gh workflow run $WF -r $BR 




