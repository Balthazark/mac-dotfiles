eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml
alias dcupd="docker compose up -d"
alias dsall='docker stop $(docker ps -aq) && docker rm $(docker ps -aq)'
alias dpsa='docker ps -a'
