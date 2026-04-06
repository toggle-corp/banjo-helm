#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export SCRIPT_DIR

function release_custom_hook {
    # shellcheck disable=SC2154
    echo "Running custom hook for ${version_tag}"

    msg="# managed by release.sh"
    sed -E -i "s/^version: .* $msg$/version: ${version_tag}  $msg/" "./chart/Chart.yaml"
    git add "./chart/Chart.yaml"
}

export -f release_custom_hook
export START_COMMIT="a9e9c76bd3ed17667bf88837f9c968387fc18fac"
export RELEASE_CUSTOM_HOOK=release_custom_hook
export REPO_NAME=toggle-corp/banjo-helm
export DEFAULT_BRANCH=main
export VERSION_TAG_PREFIX_MODE=forbid

export GIT_CLIFF__REMOTE__GITHUB__OWNER=toggle-corp
export GIT_CLIFF__REMOTE__GITHUB__REPO=banjo-helm

# Forward the argument - used for pre-fill version
"$SCRIPT_DIR/fugit/scripts/release.sh" "${@:-}"
