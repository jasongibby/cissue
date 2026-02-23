# cissue

A fast, fuzzy GitHub issue picker for the terminal. Browse your assigned issues, copy issue numbers, or launch Claude directly on an issue.

![cissue demo](https://raw.githubusercontent.com/jasongibby/cissue/main/demo.png)

## Features

- Fuzzy search across your assigned issues
- Dynamically colored statuses (respects your terminal theme)
- Scoped to the current git repo by default
- 5-minute local cache for near-instant repeat launches
- Launch Claude directly on an issue with a single keystroke

## Requirements

- [gh](https://cli.github.com/) — GitHub CLI, authenticated
- [fzf](https://github.com/junegunn/fzf) — fuzzy finder
- [figlet](http://www.figlet.org/) — ASCII art title
- [jq](https://stedolan.github.io/jq/) — JSON processing
- macOS (uses `pbcopy` for clipboard)

## Install

```bash
git clone https://github.com/jasongibby/cissue.git
cd cissue
bash install.sh
```

## Configuration

On first run, `cissue` will prompt for your GitHub org name and save it to `~/.config/cissue/config`. To change it later:

```bash
cissue --set-org
```

## Usage

```bash
cissue              # issues in the current repo
cissue -g           # all issues across the org
cissue -r           # force refresh the cache
cissue -g -r        # global + force refresh
cissue --set-org    # change your GitHub org
cissue --help       # show all options
```

### Keybindings

| Key | Action |
|-----|--------|
| `↑↓` | Navigate |
| `Enter` | Copy issue number to clipboard |
| `Ctrl+o` | Launch Claude on the issue |
| `Esc` | Exit |

## How it works

`cissue` runs a targeted GitHub GraphQL search for issues assigned to the currently authenticated `gh` user. Results are cached locally for 5 minutes so repeat launches are instant. The cache is scoped per repo so switching projects always shows the right issues.
