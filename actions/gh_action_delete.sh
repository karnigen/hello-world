#!/usr/bin/env bash

set -e
#set -x

# exit

# workflow
WF=build-windows64.yml

# branch
#BR=kgn/compile
BR=$(git rev-parse --abbrev-ref HEAD)




gh run list --workflow $WF --json databaseId --limit 5000 | jq -r '.[].databaseId'

echo "Do you want to delete all runs for workflow $WF? (y/n)"
read -r answer
if [[ "$answer" != "y" ]]; then
  echo "Exiting without deleting runs."
  exit 0
fi

# echo "Deleting all runs for workflow $WF..."
# gh run list --workflow $WF --json databaseId --limit 5000 | jq -r '.[].databaseId' | xargs -I {} gh run delete {}
# echo "... done"

# Delete all but one
gh run list --workflow $WF --json databaseId --limit 5000 | jq -r '.[].databaseId' | tail -n +2 | xargs -I {} gh run delete {}
echo "All runs for workflow $WF have been deleted except the most recent one."
