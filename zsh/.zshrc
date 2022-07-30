# Integrations {{{

. /opt/homebrew/opt/asdf/libexec/asdf.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
. /opt/homebrew/etc/profile.d/z.sh
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
# }}}

# Optics {{{
if [ -f /opt/homebrew/share/liquidprompt ]; then
    . /opt/homebrew/share/liquidprompt
fi
# }}}

# Completion Settings {{{
autoload -Uz compinit && compinit -i
# no usernames in ssh completion
zstyle ':completion:*:ssh:argument-1:*' tag-order hosts
zstyle ':completion:*:ssh:*:hosts' ignored-patterns broadcasthost
zstyle ':completion:*:*:*:default' menu yes select search interactive
# }}}

# Aliases {{{
alias ls="exa --header --long --classify --icons --color=auto --all --sort modified --time-style iso"
alias l="exa --grid --classify --icons --color=auto --all --sort name"
# }}}

# {{{ Env
export GOPATH=/home/florian/dev/go
export SSH_AUTH_SOCK=/Users/florian/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters
# }}}

# Things that want to go last {{{
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# }}}

# vim: set foldmethod=marker:
