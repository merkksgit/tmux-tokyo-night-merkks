# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Architecture Overview

This is a tmux plugin that applies the Tokyo Night color scheme to tmux's status bar. The architecture follows a modular, function-driven design:

**Entry Flow:**
```
tmux-tokyo-night-merkks.tmux → src/theme.sh → loads palette + utils → generates status bar
```

**Key Components:**
- **theme.sh**: Main orchestrator that reads configuration, loads color palette, generates status bar components, and manages the plugin system
- **utils.sh**: Pure utility functions for reading tmux options and generating status bar strings
- **palletes/night.sh**: Tokyo Night color definitions as a Bash associative array (`PALLETE`)
- **plugin/*.sh**: Modular plugins that extend status bar functionality

## Plugin System

Plugins are dynamically loaded and rendered into the status bar. The system supports both static and dynamic content.

**Plugin Contract:**
Each plugin must:
1. Export three variables: `plugin_<name>_icon`, `plugin_<name>_accent_color`, `plugin_<name>_accent_color_icon`
2. Return content when executed (via function or echo)
3. Use `get_tmux_option()` to read user configuration

**Special Cases:**
- **datetime/battery plugins**: Execute immediately and embed output into status bar
- **Other plugins**: Use tmux's `#()` syntax to execute dynamically on refresh
- **Non-existent plugins**: Rendered as literal text (allows custom text in plugin list)

**Indirect Variable Expansion:**
The plugin system uses `${!var}` to dynamically resolve plugin-specific variables:
```bash
icon_var="plugin_${plugin}_icon"
plugin_icon="${!icon_var}"
```

## Theme Variations

New themes are added by creating palette files in `src/palletes/`:
1. Create `src/palletes/<name>.sh`
2. Define `PALLETE` associative array with same color keys as `night.sh`
3. Export the `PALLETE` variable
4. Users set `@theme_variation <name>` in their tmux.conf

The palette is loaded dynamically based on `@theme_variation` option (defaults to "night").

## Transparent Status Bar

When `@theme_transparent_status_bar` is true:
- Status bar background becomes `default` (inherits terminal background)
- Inverse separators are used (via `@theme_transparent_*_separator_inverse` options)
- Plugin backgrounds remain colored for visual separation

## Configuration System

All customization happens via `@theme_*` tmux options read with `get_tmux_option()`. The function returns a default value if the option is unset, allowing graceful degradation.

**Critical Options:**
- `@theme_plugins`: Comma-separated plugin list (default: "datetime")
- `@theme_variation`: Palette name (default: "night")
- `@theme_left_separator`, `@theme_right_separator`: Powerline separators (default: U+E0B0, U+E0B2)

## Testing Changes

To test changes to the theme:
```bash
# Reload tmux configuration
tmux source-file ~/.tmux.conf

# Or reload just this plugin (if using TPM)
tmux run-shell ~/.tmux/plugins/tmux-tokyo-night-merkks/tmux-tokyo-night-merkks.tmux
```

## Tmux String Formatting

Status bar strings use tmux format syntax:
- `#[fg=COLOR,bg=COLOR]text#[none]`: Set colors and reset
- `#{?condition,true,false}`: Conditional expressions
- `#()`: Execute shell command dynamically
- Always use `#[none]` to reset styling after colored sections

## Development Notes

- The codebase uses `set -euxo pipefail` in theme.sh for strict error handling during development
- Powerline separators require a Nerd Font or font with powerline glyphs
- Plugin execution happens twice: once for output (`$()`) and once for variable sourcing (`.`)
