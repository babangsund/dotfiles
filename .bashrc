# If not running interactively, don't do anything...
[ -z "$PS1" ] && return

# General {{
  export PATH=$HOME/bin:$PATH
# }}

# Alias {{
  alias c="clear"
  alias vi="nvim"
  alias vim="nvim"
  alias @='cd $(git rev-parse --show-cdup)'
# }}

# Path Alias {{
  shopt -s cdable_vars # https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#The-Shopt-Builtin
  export dev=$HOME/Development
# }}

# NVM {{
  export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
# }}

# Java {{
  export JAVA_HOME=$(/usr/libexec/java_home)
  export PATH=$JAVA_HOME/bin:$PATH
# }}

# FZF {{
  export FZF_DEFAULT_COMMAND="rg --files --no-ignore-vcs"
  [ -f ~/.fzf.bash ] && source ~/.fzf.bash

  vf() {
    file="$(fzf)"
    [[ -n $file ]] && vim $file
  }

  bind -x '"\C-p": vf';
# }}

# Git {{
  parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
  }
  export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
# }}
