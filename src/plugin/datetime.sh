#!/usr/bin/env bash
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck source=src/utils.sh
. "$ROOT_DIR/../utils.sh"

# shellcheck disable=SC2005
plugin_datetime_icon=$(get_tmux_option "@theme_plugin_datetime_icon" "")
plugin_datetime_accent_color=$(get_tmux_option "@theme_plugin_datetime_accent_color" "bg_highlight")
plugin_datetime_accent_color_icon=$(get_tmux_option "@theme_plugin_datetime_accent_color_icon" "bg_highlight")

# https://man7.org/linux/man-pages/man1/date.1.html
plugin_datetime_format=$(get_tmux_option "@theme_plugin_datetime_format" " %H:%M")

function load_plugin() {
    echo "${plugin_datetime_format}"
}
load_plugin

export plugin_datetime_icon plugin_datetime_accent_color plugin_datetime_accent_color_icon
