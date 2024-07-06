autoload -Uz compinit promptinit vcs_info
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




[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh
#comment the line above to upgrade 


function zvm_config() {
	ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
	ZVM_VI_INSERT_ESCAPE_BINDKEY=jj
	ZVM_VI_HIGHLIGHT_BACKGROUND=#003355
	ZVM_VI_EDITOR=nvim
}

source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh


eval "$(zoxide init --cmd cd zsh)"
