. ~/.aliases

git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/'
}

# change_iterm_colors() {
#   osascript -e "tell application \"iTerm\"\
#     to tell the current terminal\
#       to tell the current session\
#         to set the background color to \"$1\""
#   osascript -e "tell application \"iTerm\"\
#     to tell the current terminal\
#       to tell the current session\
#         to set the foreground color to \"$2\""
# }
# 
# ssh() {
#   change_iterm_colors blue white
# 
#   /usr/bin/ssh "$@"
# 
#   change_iterm_colors white black
# }

setopt PROMPT_SUBST
export PS1='%2~$(git_branch)%# '

export EDITOR='mate -w'
export PATH=$HOME/bin:$PATH:/usr/local/sbin

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
