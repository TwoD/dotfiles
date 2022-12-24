#set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"
set -gx GPG_TTY (tty)
if test -f /usr/bin/gpg-connect-agent
  gpg-connect-agent updatestartuptty /bye > /dev/null 2>&1
end
set -gx BUILDDIR /tmp/makepkg
set -gx EDITOR /usr/bin/vim
set -gx PATH ~/bin /usr/local/bin $PATH

function tmat
  tmux attach || tmux new
end

# Allow local overrides.
source ~/.config/fish/config.local.fish
