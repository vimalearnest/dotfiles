#################################  HISTORY  #################################
# history
HISTFILE=$HOME/.zsh-history # file to save history
HISTSIZE=100000             # history size in-memory
SAVEHIST=1000000            # history size in the file
# share .zshhistory
setopt inc_append_history   # save the command to history when running
setopt share_history        # share history with other session
#################################  COMPLEMENT  #################################
# enable completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}'
zstyle ':completion:*' format '%B%F{blue}%d%f%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:default' menu select=2
#################################  OTHERS  #################################
# automatically change directory when dir name is typed
setopt auto_cd
# disable ctrl+s, ctrl+q
setopt no_flow_control
