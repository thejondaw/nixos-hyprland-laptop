#!/bin/bash

apps=(
    "firefox"
    "wezterm"
    "thunar"
    "codium"
    "telegram-desktop"
    "spotify"
)

selected=$(printf '%s\n' "${apps[@]}" | rofi -dmenu -config ~/.config/rofi/config/apps.rasi -theme ~/.config/rofi/themes/catppuccin-macchiato.rasi)

if [ ! -z $selected ]; then
    $selected &
fi
