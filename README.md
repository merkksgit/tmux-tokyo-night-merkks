# tmux-tokyo-night-merkks

[![tmux](https://img.shields.io/badge/tmux-1BB91F?logo=tmux&logoColor=fff)](#) [![Bash](https://img.shields.io/badge/Bash-4EAA25?logo=gnubash&logoColor=fff)](#) [![License](https://img.shields.io/github/license/merkksgit/tmux-tokyo-night-merkks)](#) [![Tokyo Night](https://img.shields.io/badge/Tokyo_Night-7aa2f7?style=flat&logoColor=white)](#)

A custom variation of [tmux-powerkit](https://github.com/fabioluciano/tmux-powerkit) with personalized Tokyo Night color schemes.

## Installation

### Using TPM (Tmux Plugin Manager)

Add the following line to your `~/.tmux.conf`:

```tmux
set -g @plugin 'merkksgit/tmux-tokyo-night-merkks'
```

Then press `prefix + I` (capital i, as in Install) to fetch the plugin.

### Manual Installation

Clone this repository:

```bash
git clone https://github.com/merkksgit/tmux-tokyo-night-merkks ~/.tmux/plugins/tmux-tokyo-night-merkks
```

Add this line to your `~/.tmux.conf`:

```tmux
run-shell ~/.tmux/plugins/tmux-tokyo-night-merkks/tmux-tokyo-night-merkks.tmux
```

Reload tmux configuration:

```bash
tmux source-file ~/.tmux.conf
```

## Theme Variations

This plugin offers two theme variations:

### Night (Default)
The original Tokyo Night color scheme.

![Night Preview](./previews/preview-night.png)

### Merkks
My own custom theme variation with personalized colors.

![Merkks Preview](./previews/preview-merkks.png)

To set your preferred theme variation, add this line to your `~/.tmux.conf`:

```tmux
# For the original Tokyo Night theme (default)
set -g @theme_variation "night"

# Or for the merkks theme
set -g @theme_variation "merkks"
```

Then reload tmux:

```bash
tmux source-file ~/.tmux.conf
```

## License

See [LICENSE](LICENSE) file.
