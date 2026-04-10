#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export SCRIPT_DIR

"$SCRIPT_DIR/../fugit/scripts/helm-update-snapshots.sh" "$@"
