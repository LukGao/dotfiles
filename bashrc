function _fish_collapsed_pwd() {
    local pwd="$1"
    local home="$HOME"
    local size=${#home}
    [[ $# == 0 ]] && pwd="$PWD"
    [[ -z "$pwd" ]] && return
    if [[ "$pwd" == "/" ]]; then
        echo "/"
        return
    elif [[ "$pwd" == "$home" ]]; then
        echo "~"
        return
    fi
    [[ "$pwd" == "$home/"* ]] && pwd="~${pwd:$size}"
    if [[ -n "$BASH_VERSION" ]]; then
        local IFS="/"
        local elements=($pwd)
        local length=${#elements[@]}
        for ((i=0;i<length-1;i++)); do
            local elem=${elements[$i]}
            if [[ ${#elem} -gt 1 ]]; then
                elements[$i]=${elem:0:1}
            fi
        done
    else
        local elements=("${(s:/:)pwd}")
        local length=${#elements}
        for i in {1..$((length-1))}; do
            local elem=${elements[$i]}
            if [[ ${#elem} > 1 ]]; then
                elements[$i]=${elem[1]}
            fi
        done
    fi
    local IFS="/"
    echo "${elements[*]}"
}

function brew_disable() {
        export PATH=${PATH##*"/.linuxbrew/bin:"}
        export PATH=${PATH##*"/.linuxbrew/sbin:"}
        export MANPATH=${MANPATH##*"/.linuxbrew/share/man:"}
        export INFOPATH=${INFOPATH##*"/.linuxbrew/share/info:"}
}

function brew_enable() {
        BREW='/home/linuxbrew/.linuxbrew'
        brew_disable
        export PATH="$BREW/bin:$BREW/sbin:$PATH"
        export MANPATH="$BREW/share/man:$MANPATH"
        export INFOPATH="$BREW/share/info:$INFOPATH"
        export HOMEBREW_NO_AUTO_UPDATE=1
}

# homebrew
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.ustc.edu.cn/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.ustc.edu.cn/homebrew-core.git"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"
export HOMEBREW_API_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles/api"
export HOMEBREW_NO_AUTO_UPDATE=1

# bash PS1
if [ -n "$BASH_VERSION" ]; then
    if [ "$UID" -eq 0 ]; then
        export PS1='\[\e[38;5;135m\]•\[\e[0m\] •\[\e[38;5;166m\] •\[\e[0m\] \[\e[32m\]$(_fish_collapsed_pwd)\[\e[0m\] \[\e[31m\]➜\[\e[0m\] '
    else
        export PS1='\[\e[38;5;135m\]•\[\e[0m\] •\[\e[38;5;166m\] •\[\e[0m\] \[\e[32m\]$(_fish_collapsed_pwd)\[\e[0m\] \[\e[32m\]➜\[\e[0m\] '
    fi
fi

# ssh
[ -z $SSH_TTY ] || PS1='\[\e[0;30m\]\[\e[47m\]SSH\[\e[0m\] '$PS1


# fzf
export RUNEWIDTH_EASTASIAN=0
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export BAT_THEME="Dracula"
export FZF_DEFAULT_COMMAND="fd --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build} --type f"
export FZF_DEFAULT_OPTS="--no-info --no-scrollbar --height 60% --layout=reverse --ansi --border=none"
export FZF_CTRL_T_OPTS="--no-info --no-scrollbar --height 60% --layout=reverse --ansi --border=none --preview 'bat -n --color=always --line-range=:500 {}'"

# alias
alias zc='z -c'      # 严格匹配当前路径的子路径
alias zf='z -I'      # 使用 fzf 对多个结果进行选择
alias zb='z -b'      # 快速回到父目录
alias on='nvim $(fzf --height 40% --reverse)'
alias ok='nvim'
alias tmux='tmux -2'

alias vi='nvim -u NONE -N'
alias vim="nvim -u NONE"

alias proxy='export all_proxy=socks5://127.0.0.1:1080'
alias unproxy='unset all_proxy'

# golang
if command -v go &> /dev/null
    export PATH="$HOME/go/bin:$PATH"
    export GO111MODULE=on
    export GOPROXY=https://goproxy.cn,direct
fi

# bash history
HISTSIZE=99999
HISTFILESIZE=99999
shopt -s histappend
PROMPT_COMMAND='history -a'

# git
alias git-ls="\\ls -A --group-directories-first -1 | while IFS= read -r line; do git log --color --format=\"\$(\\ls -d -F --color \"\$line\") =} %C(bold black)▏%Creset%Cred%h %Cgreen(%cr)%Creset =} %C(bold black)▏%Creset%s %C(bold blue)<%an>%Creset\" --abbrev-commit --max-count 1 HEAD -- \"\$line\"; done | awk -F'=}' '{ nf[NR]=NF; for (i = 1; i <= NF; i++) { cell[NR,i] = \$i; gsub(/\\033\\[([[:digit:]]+(;[[:digit:]]+)*)?[mK]/, \"\", \$i); len[NR,i] = l = length(\$i); if (l > max[i]) max[i] = l; } } END { for (row = 1; row <= NR; row++) { for (col = 1; col < nf[row]; col++) printf \"%s%*s%s\", cell[row,col], max[col]-len[row,col], \"\", OFS; print cell[row,nf[row]]; } }'"

# z.lua
eval "$(lua ~/.z.lua/z.lua --init bash once enhanced echo fzf)"
