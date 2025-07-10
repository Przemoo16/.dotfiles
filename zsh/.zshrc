export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

alias vi="nvim"
alias vim="nvim"

bindkey -v
bindkey -s ^s "tmux-sessionizer\n"

source <(fzf --zsh)

eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"
