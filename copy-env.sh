#!/bin/bash

set -euo pipefail

cp -r "$HOME/.config/alacritty" ./env/.config
cp -r "$HOME/.config/i3" ./env/.config
cp -r "$HOME/.config/i3status" ./env/.config
cp -r "$HOME/.config/nvim" ./env/.config
cp "$HOME/.zshrc" ./env
