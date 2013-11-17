# Configure and activate nodenv. You know, for nodes.

set -x NODENV_ROOT $BOXEN_HOME/nodenv

set -x PATH $BOXEN_HOME/nodenv/bin $PATH

. (nodenv init - fish | psub)

set -x PATH node_modules/.bin $PATH

