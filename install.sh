#!/bin/bash

set -euo pipefail

cd ~/.dotfiles

for dir in */; do
    echo "stow $dir"
    stow "$dir"
done
