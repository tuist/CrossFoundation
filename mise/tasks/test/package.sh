#!/usr/bin/env bash
# MISE description="Build the Swift package"
#MISE depends=["build:zig"]

set -eo pipefail

swift test

