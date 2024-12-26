#!/usr/bin/env bash

# Путь к файлу с избранными приложениями
apps_file="$HOME/.config/rofi/favorite_apps"

# Если нет аргументов - выводим список
if [ -z "$@" ]; then
    cat "$HOME/.config/rofi/favorite_apps"
else
    # Запускаем выбранное приложение
    "$@" &
fi
