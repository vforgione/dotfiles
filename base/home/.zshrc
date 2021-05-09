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

if [[ -x $(command -v brew) ]]; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
  zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
  autoload -Uz compinit
  compinit
fi


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
alias -g la='lsd -lhA'

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
[[ $OSTYPE =~ darwin ]] && export PATH=$PATH:/usr/local/bin/MacGPG2/bin

# add asdf-vm to the path
if [[ -f $HOME/.asdf/asdf.sh ]]; then
  . $HOME/.asdf/asdf.sh
  fpath=(${ASDF_DIR}/completions $fpath)
  autoload -Uz compinit
  compinit
fi

# if asdf installed java; set java home
[[ -d $HOME/.asdf/plugins/java/ ]] && . $HOME/.asdf/plugins/java/set-java-home.zsh

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

[[ -f $HOME/.zshrc.local ]] && source $HOME/.zshrc.local
