#!/usr/bin/env zsh
# Zsh core configuration

# History Configuration
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS    # Remove older duplicate entries
setopt HIST_FIND_NO_DUPS       # Don't show duplicates when searching
setopt HIST_REDUCE_BLANKS      # Remove superfluous blanks
setopt HIST_VERIFY             # Show command before executing from history
setopt INC_APPEND_HISTORY      # Add commands immediately

# Directory Navigation
setopt AUTO_CD                 # Type directory name to cd
setopt AUTO_PUSHD             # Push directories onto stack
setopt PUSHD_IGNORE_DUPS      # Don't push duplicates
setopt PUSHD_MINUS            # Exchange + and - meanings

# Completion System
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select                    # Menu selection
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'  # Case insensitive
zstyle ':completion:*' list-colors ''                # Colorize completions
zstyle ':completion:*' group-name ''                 # Group completions
zstyle ':completion:*:descriptions' format '%B%d%b'  # Bold descriptions

# Key Bindings
bindkey -e                                    # Emacs key bindings
bindkey '^[[A' history-search-backward       # Up arrow
bindkey '^[[B' history-search-forward        # Down arrow
bindkey '^[[H' beginning-of-line            # Home
bindkey '^[[F' end-of-line                  # End
