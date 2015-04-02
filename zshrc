
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

autoload -Uz compinit
compinit

setopt PROMPT_SUBST
export PROMPT='%2~$(git_branch)%# '
export EDITOR='mate -w'
export GOPATH="$HOME/code/go"
export PGDATA="$HOME/.pgdata"

# This is for homebrew
# Yes, I'm adding /usr/local/bin to path again.
# I want it to show up before /usr/bin so I'm adding it to the front.
# Not sure how to remove the other entry from the end, but alas, it works.
export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH"

if [[ -s /usr/local/opt/chruby/share/chruby/chruby.sh ]]; then
  source /usr/local/opt/chruby/share/chruby/chruby.sh
fi

[[ -s ~/.aliases ]] && . ~/.aliases
[[ -s ~/.localrc ]] && . ~/.localrc
