
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
compinit

compctl -K _ssha_comp ssha

setopt PROMPT_SUBST
export PROMPT='%2~$(git_branch)%# '

# This is for homebrew
# Yes, I'm adding /usr/local/bin to path again.
# I want it to show up before /usr/bin so I'm adding it to the front.
# Not sure how to remove the other entry from the end, but alas, it works.
PATH="/usr/local/bin:/usr/local/sbin:$PATH"

export PATH="$HOME/bin:$GOPATH/bin:$PATH"

[[ -s ~/.aliases ]] && . ~/.aliases
[[ -s ~/.localrc ]] && . ~/.localrc
