
export PGDATA="$HOME/.pgdata"

[[ -s ~/.aliases ]] && . ~/.aliases
[[ -s ~/.localrc ]] && . ~/.localrc

git_branch() {
  git branch 2> /dev/null | grep "^*" | sed -e "s/\* \(.*\)/[\1]/"
}

psg() {
  ps wwwaux | egrep "($1|%CPU)" | grep -v grep
}

setopt PROMPT_SUBST
export PS1='%2~$(git_branch)%# '

export EDITOR='mate -w'

# Yes, I'm adding /usr/local/bin to path again.
# I want it to show up before /usr/bin so I'm adding it to the front.
# Not sure how to remove the other entry from the end, but alas, it works.
export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
