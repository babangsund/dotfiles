# If not running interactively, don't do anything...
[ -z "$PS1" ] && return

# General {{
  export PATH=$HOME/bin:$PATH
  export MYVIMRC=$HOME/.vimrc
  export GIT=$HOME/.config/git
# }}

# Completions {{
  source $HOME/.bash_completion/alacritty
# }}

# Alias {{
  alias c="clear"
  alias vi="nvim"
  alias vim="nvim"
  alias @='cd $(git rev-parse --show-cdup)'

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
  [ -f $HOME/.fzf.bash ] && source $HOME/.fzf.bash

  vf() {
    local file
    file="$(fzf)"
    [[ -n $file ]] && vim $file
  }

  fd() {
    local dir
    dir=$(find ${1:-.} -path '*/\.*' -prune \
      -o -type d -print 2> /dev/null | fzf +m)

    [[ -n $dir ]] && cd "$dir"
  }

  fbr() {
    local branches branch
    branches=$(git --no-pager branch -vv) &&
    branch=$(echo "$branches" | fzf +m) &&
    git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
  }

  fif() {
    [ ! "$#" -gt 0 ] && return 1
    rg --files-with-matches --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
  }

  bind -x '"\C-p": vf';
# }}

# Git {{
  parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
  }
  export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
# }}
