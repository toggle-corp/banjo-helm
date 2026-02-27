#!/usr/bin/env bash

set -euo pipefail

helm unittest chart -f "tests/**/*_test.yaml"
