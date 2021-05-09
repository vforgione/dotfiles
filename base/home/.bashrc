# if not running interactively, exit
case $- in
  *i*) ;;
    *) return ;;
esac

# set shopts
shopt -s histappend
shopt -s checkwinsize
shopt -s globstar

# configure the history file
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

# make less more friendly for non-text input files
[[ -x /usr/bin/lesspipe ]] && eval "$(SHELL=/bin/sh lesspipe)"

# enable programmable completion features
[[ -r /usr/local/etc/profile.d/bash_completion.sh ]] \
  && . /usr/local/etc/profile.d/bash_completion.sh

# ls aliases
alias lsd='lsd --date "+%Y-%m-%d %H:%M:%S" --size short'
alias ll='lsd -lh'
alias la='lsd -lhA'

# cat aliases
alias cat='bat'

# cp aliases
alias cpdir='rsync -avr'

# reset source
function src {
  if [[ -r $HOME/.bash_profile ]]; then
    source $HOME/.bash_profile
  else
    source $HOME/.bashrc
  fi
}

# am i in a python virtual environment?
function invenv {
  if [[ "${VIRUTAL_ENV}" != "" ]]; then
    echo "You're in a virtualenv: ${VIRTUAL_ENV}"
  else
    echo "You're not in a virtualenv"
  fi
}

# set vim as the default editor
_vimpath=$(command -v vim)
[[ "${_vimpath}" != "" ]] && export EDITOR=$_vimpath
unset _vimpath

# add gpg bin to path if on macos
[[ "${OSTYPE}" =~ "darwin" ]] && export PATH=$PATH:/usr/local/MacGPG2/bin

# add pyenv to path
[[ -x "$(command -v pyenv)" ]] && \
  export PYENV_ROOT="$HOME/.pyenv" && \
  export PATH="$PYENV_ROOT/bin:$PATH" && \
  eval "$(pyenv init -)"

# set a default ps1
PS1="\w \\$ "

# absolute local system setting overrides
[[ -f $HOME/.bashrc.local ]] && source $HOME/.bashrc.local
