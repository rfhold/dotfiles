# Path to your dotfiles.
export DOTFILES=$HOME/dotfiles

HIST_STAMPS="dd/mm/yyyy"

export HISTIGNORE="pwd:ls:cd"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$XDG_CONFIG_HOME/zsh

# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
gpg-connect-agent /bye

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

eval "$(starship init zsh)"
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Enable auto suggestions one word at a time
bindkey '^ ' forward-word

# Add directories to the PATH and prevent to add the same directory multiple times upon shell reload.
add_to_path() {
  if [[ -d "$1" ]] && [[ ":$PATH:" != *":$1:"* ]]; then
    export PATH="$1:$PATH"
  fi
}

# Load dotfiles binaries
add_to_path "$DOTFILES/bin"

add_to_path "$HOME/go/bin"
add_to_path "$HOME/.cargo/bin"

alias rdns="sudo killall -HUP mDNSResponder && echo macOS DNS Cache Reset"

export DOCKER_HOST="unix:///${HOME}/.config/colima/default/docker.sock"
export TESTCONTAINERS_HOST_OVERRIDE=127.0.0.1
# export TESTCONTAINERS_RYUK_DISABLED=true

export GOPRIVATE=github.com/cfaintl

alias export-openai="export OPENAI_API_KEY=\$(gpg --decrypt ~/.openaikey.asc)"

