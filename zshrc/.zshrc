# Path to startship config
export STARSHIP_CONFIG=~/.config/starship/starship.toml
# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Load completions
autoload -Uz compinit && compinit

# Keybindings
bindkey -v
bindkey -M viins '^E' autosuggest-accept
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Create color themes
export LS_COLORS="$(vivid generate catppuccin-mocha)"
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--color=border:#313244,label:#cdd6f4"

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --icons=always --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza --icons=always --color=always $realpath'

# Aliases
alias ls='eza --icons=always'
alias vim='nvim'
alias c='clear'

alias nf='nvim $(fzf -m --preview="bat --color=always {}")'
alias bf='fzf -m --preview="bat --color=always {}"'

alias dcupd="docker compose up -d"
alias dsall='docker stop $(docker ps -aq) && docker rm $(docker ps -aq)'
alias dpsa='docker ps -a'

# Functions
function nvm() {
  # Remove this function so the real nvm command can be used
  unset -f nvm
  # Source nvm (adjust the path if your nvm is installed elsewhere)
  if [ -s "$HOME/.nvm/nvm.sh" ]; then
    . "$HOME/.nvm/nvm.sh"
  fi
  # Optionally load nvm bash completion if desired
  if [ -s "$HOME/.nvm/bash_completion" ]; then
    . "$HOME/.nvm/bash_completion"
  fi
  # Re-run nvm with the passed arguments
  nvm "$@"
}

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"
