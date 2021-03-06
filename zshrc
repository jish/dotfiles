
git_branch() {
  git branch 2> /dev/null | grep "^*" | sed -e "s/\* \(.*\)/[\1]/"
}

psg() {
  ps wwwaux | egrep -i "($1|%CPU)" | grep -v grep
}

fs() {
  ([ -s Procfile.dev ] && foreman start -f Procfile.dev $1 ) || foreman start $1
}

iterm_profile() {
  echo -e "\033]50;SetProfile=$1\a"
}

ssha() {
  key=$1
  if [[ -z ${key} ]]; then
    key='id_rsa'
  fi

  ssh-add -t 28800 ~/.ssh/$key
}

_ssha_comp() {
  reply=( $(ls ~/.ssh) )
}

autoload -Uz compinit
# Run compinit in the background
#
# https://htr3n.github.io/2018/07/faster-zsh/
#
{ compinit } &!

compctl -K _ssha_comp ssha

setopt PROMPT_SUBST
export PROMPT='%2~$(git_branch)%# '

# Mac OS's path helper (called from `/etc/zprofile`) overwrites PATH
# modifications made in `.zshenv` because zprofile is loaded after
# zshenv. For this reason, the PATH environment variable is being
# defined in `.zshrc` instead of `.zshenv`.
#
# http://www.softec.lu/site/DevelopersCorner/MasteringThePathHelper
#
path=(
  "${HOME}/bin"
  "${HOME}/.cargo/bin"
  "${GOPATH}/bin"
  "/usr/local/sbin"
  "$path[@]"
)

[[ -s ~/.aliases ]] && . ~/.aliases
[[ -s ~/.localrc ]] && . ~/.localrc

export PATH
