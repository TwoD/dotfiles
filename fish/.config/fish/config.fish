set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"
set -gx BUILDDIR /tmp/makepkg
set -gx EDITOR /usr/bin/vim
# Fix /etc/profile.d/ compatibility.
env -i HOME=$HOME dash -l -c 'export -p' | sed -e "/PWD/d; /PATH/s/'//g;/PATH/s/:/ /g;s/=/ /;s/^export/set -x/" | source
set -gx PATH ~/bin /usr/local/bin $PATH
# Allow local overrides.
source ~/.config/fish/config.local.fish
