export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

export PATH="$HOME/.local/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

alias vi="nvim"
alias vim="nvim"

bindkey -v
bindkey -s ^s "tmux-sessionizer\n"

source <(fzf --zsh)

source "$HOME/.cargo/env"

eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"
