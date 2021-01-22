##             ##
#  ZSH OPTIONS  #
##             ##

setopt AUTO_CD
setopt CORRECT
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS
setopt NO_CASE_GLOB


##                ##
#  TAB COMPLETION  #
##                ##

[[ -x $(command -v brew) ]] \
  && FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH \
  && zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' \
  && autoload -Uz compinit \
  && compinit


##         ##
#  ALIASES  #
##         ##

# use bat instead of cat
alias -g cat='bat'

# recursively copy directories with rsync
alias -g cpr='rsync -avr'

# use lsd instead of ls
alias -g lsd='lsd --date "+%Y-%m-%d %H:%M:%S" --size short'
alias -g ll='lsd -lh'
alias -g la='ll -A'

# auto set the p flag for mkdir
alias -g mkdir='mkdir -p'

# use nvim instead of vim
alias -g vim='nvim'


##         ##
#  EXPORTS  #
##         ##

# set neovim as the default editor
export EDITOR=nvim

# if macos then add GPG Stuie's bin to path
[[ $OSTYPE =~ darwin ]] \
  && export PATH=$PATH:/usr/local/bin/MacGPG2/bin

# set go path and add its bin to path
export GOPATH=$HOME/.go

[[ -d $GOPATH/bin ]] \
  && export PATH=$PATH:$GOPATH/bin

# if pyenv then add its bin to path
[[ -x $(command -v pyenv) ]] \
  && export PYENV_ROOT=$HOME/.pyenv \
  && export PATH=$PYENV_ROOT/bin:$PATH \
  && eval "$(pyenv init -)"

# if sdkman then add its bin to path
export SDKMAN_DIR=$HOME/.sdkman

[[ -x $(command -v sdk) ]] \
  && source $SDKMAN_DIR/bin/sdkman-init.sh

# setup xdg vars
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

##                 ##
#  SETUP PROMPT(S)  #
##                 ##

PROMPT='%~ %# '


##                 ##
#  LOCAL OVERRIDES  #
##                 ##

[[ -f $HOME/.zshrc.local ]] \
  && source $HOME/.zshrc.local
