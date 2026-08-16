#!/usr/bin/env bash

set -euo pipefail

config_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)

sudo nixos-rebuild switch --flake "path:${config_dir}#nixos"
