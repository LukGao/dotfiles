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
orange=$(tput setaf 1);
yellow=$(tput setaf 4);
green=$(tput setaf 12); 
bold=$(tput bold); 
reset=$(tput sgr0);
if [ -n "$BASH_VERSION" ]; then
    if [ "$UID" -eq 0 ]; then
        #export PS1='\[\e[38;5;135m\]\u\[\e[0m\]@\[\e[38;5;166m\]\h\[\e[0m\] \[\e[31m\]$(_fish_collapsed_pwd)\[\e[0m\] \[\e[31m\]➜\[\e[0m\] '
        export PS1='\[\e[38;5;135m\]•\[\e[0m\]•\[\e[38;5;166m\]•\[\e[0m\] \[\e[32m\]$(_fish_collapsed_pwd)\[\e[0m\] \[\e[31m\]➜\[\e[0m\] '
    else
        #export PS1="\[${bold}\] \[${orange}\]>\[${yellow}\]>\[${reset}\] $(_fish_collapsed_pwd) ➜ "
        export PS1='\[\e[38;5;135m\]•\[\e[0m\]•\[\e[38;5;166m\]•\[\e[0m\] \[\e[32m\]$(_fish_collapsed_pwd)\[\e[0m\] \[\e[32m\]➜\[\e[0m\] '
    fi
fi

[ -f ~/.fzf.bash  ] && source ~/.fzf.bash
eval "$(lua ~/.z.lua/z.lua --init bash once enhanced echo fzf)"

export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --preview '( coderay {} || rougify {} || highlight -O ansi {} || cat {}) 2> /dev/null | head -500'"
export FZF_DEFAULT_COMMAND="fd --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build} --type f"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="rg --sort-files --files --null 2> /dev/null | xargs -0 dirname | uniq"

alias zc='z -c'      # 严格匹配当前路径的子路径
alias zf='z -I'      # 使用 fzf 对多个结果进行选择
alias zb='z -b'      # 快速回到父目录
alias on='nvim $(fzf --height 40% --reverse)'
alias ok='nvim'
alias tmux='tmux -2'

alias proxy='export all_proxy=socks5://127.0.0.1:1080'
alias unproxy='unset all_proxy'

export PATH="$HOME/go/bin:$PATH"
export GO111MODULE=on
export GOPROXY=https://goproxy.io
