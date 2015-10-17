# Put node-build on PATH
set -x PATH <%= scope.lookupvar("::nodejs::build::prefix") %>/bin $PATH

# Configure NODENV_ROOT and put NODENV_ROOT/bin on PATH
set -x NODENV_ROOT <%= scope.lookupvar("::nodejs::nodenv::prefix") %>
set -x PATH $NODENV_ROOT/bin $PATH

# Load nodenv
. (nodenv init - fish | psub)

set -x PATH node_modules/.bin $PATH

# Helper for shell prompts and the like
function current_node
  echo (nodenv version)
end
