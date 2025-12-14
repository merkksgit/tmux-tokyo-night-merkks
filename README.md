# tmux-tokyo-night-merkks

## Preview

![Preview](./preview.png)

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

## License

See [LICENSE](LICENSE) file.
