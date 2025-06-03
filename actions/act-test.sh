#!/usr/bin/env bash
set -e
set -x

clear

# save directory of this script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

YAML=".github/workflows/build-windows64.yml"


# check if .github is in current directory, if not got up one directory
if [ ! -d ".github" ]; then
  pushd ..
fi


#act -W $YAML -j job1
#act -W $YAML -j job1  --input number=99 --input  message=hello

#act -W $YAML   -e $SCRIPT_DIR/act_test_input.json  $@

act -W $YAML -n  # -e $SCRIPT_DIR/act_test_input.json  # -j job3 $@

# uf we use pushd, we need to popd

