export EDITOR='mate'
export GOPATH="${HOME}/code/go"
export PGDATA="${HOME}/.pgdata"
export VOLTA_HOME="${HOME}/.volta"

if [[ -s /usr/local/opt/chruby/share/chruby/chruby.sh ]]; then
  source /usr/local/opt/chruby/share/chruby/chruby.sh
fi
