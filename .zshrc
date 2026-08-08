autoload -Uz compinit promptinit vcs_info
autoload zmv
compinit
promptinit
precmd() { vcs_info }

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory





zstyle ':vcs_info:git:*' format '%b '
setopt PROMPT_SUBST
PROMPT='%F{green}%n@%m%f%F{blue}%~%f %F{red}${vcs_info_msg_0_}%f'


alias ls="ls --color=auto"
alias la="ls --color=auto -a"
alias vim="nvim"
alias vi="nvim"
alias clear-tex="~/dotfiles/scripts/clear-tex.sh"
alias tmt='python3 ~/code/tmt-cli/tmt.py'
alias emacs="emacs -nw"

export PATH=/home/willychan/.cargo/bin:$PATH
export PATH=/usr/local/texlive/2024/bin/x86_64-linux:$PATH
export PATH=/home/willychan/.local/share/gem/ruby/3.4.0/bin:$PATH
export MANPATH=/usr/local/texlive/2024/texmf-dist/doc/man:$MANPATH
export INFOPATH=/usr/local/texlive/2024/texmf-dist/doc/info:$INFOPATH
export XDG_PICTURES_DIR=/home/willychan/Pictures/
export BUNDLE_PATH=/home/willychan/.bundle
export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"


function pomo() {
    min=30
    sec=$((min * 60))
    min2=5
    sec2=$((min2 * 60))
    msg1="take a break, back in ${min2} minute"
    msg2="start working"

    while true; do
        sleep "${sec:?}" && echo "${msg1:?}" && notify-send -u critical -t 0 "${msg1:?}"
        sleep "${sec2:?}" && echo "${msg2:?}" && notify-send -u critical -t 0 "${msg2:?}"
    done
}




function zvm_config() {
	ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
	ZVM_VI_INSERT_ESCAPE_BINDKEY=jj
	ZVM_VI_HIGHLIGHT_BACKGROUND=#003355
	ZVM_VI_EDITOR=nvim
}


source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

LFCD="$HOME/.config/lf/lfcd.sh"                                #  pre-built binary, make sure to use absolute path
source "$LFCD"
alias lf="lfcd"


eval "$(zoxide init --cmd cd zsh)"
eval "$(ssh-agent)" 2>&1 >/dev/null
ssh-add $HOME/.ssh/id_ed25519  > /dev/null 2>&1


eval "$(rbenv init -)"



. "$HOME/.local/bin/env"

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/willychan/.config/.dart-cli-completion/zsh-config.zsh ]] && . /home/willychan/.config/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]


fpath+=~/.zfunc; autoload -Uz compinit; compinit

# opencode
export PATH=/home/willychan/.opencode/bin:$PATH
