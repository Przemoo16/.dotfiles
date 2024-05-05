#!/bin/bash

set -euo pipefail

cd ~/.dotfiles

for dir in */; do
    echo "stow -R $dir"
    stow "$dir"
done
