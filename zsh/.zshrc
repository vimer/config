#新环境使用chsh -s /bin/zsh 来改变默认shell，重启有效
export ZSH=~/.oh-my-zsh

#ZSH_THEME="amuse"
#ZSH_THEME="avit"
ZSH_THEME='bira'

plugins=(git)

source $ZSH/oh-my-zsh.sh
#dirs -v 列出最近的目录 cd -n 进入相应目录
#RPROMPT='%{[32m%}@%{[10m%}%n'
#PROMPT="%{[37m%}`print %~'\n$'`%{[33m%}`/sbin/ifconfig eth1 | grep "inet addr" | sed -e 's/^.*inet addr:\(.*\) Bcast.*$/\1/' | awk -F '.' '{print $4}'`%{[32m%}>>"
autoload colors
export EDITOR=emacs

#关于历史纪录的配置
# number of lines kept in history
export HISTSIZE=10000
# # number of lines saved in the history after logout
export SAVEHIST=10000
# # location of history
export HISTFILE=~/.zhistory
# # append command to history file once executed
setopt INC_APPEND_HISTORY

#Emacs风格键绑定
bindkey -e
#设置DEL键为向后删除
bindkey "\e[3~" delete-char

#以下字符视为单词的一部分
WORDCHARS='*?_-[]~=&;!#$%^(){}<>'

#自动补全功能
setopt AUTO_LIST
setopt AUTO_MENU
setopt MENU_COMPLETE

autoload -U compinit
compinit

# Completion caching
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path .zcache
#zstyle ':completion:*:cd:*' ignore-parents parent pwd

#Completion Options
zstyle ':completion:*:match:*' original only
zstyle ':completion::prefix-1:*' completer _complete
zstyle ':completion:predict:*' completer _complete
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:*' completer _complete _prefix _correct _prefix _match _approximate

# Path Expansion
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-shlashes 'yes'
zstyle ':completion::complete:*' '\\'

zstyle ':completion:*:*:*:default' menu yes select
zstyle ':completion:*:*:default' force-list always

# GNU Colors 需要/etc/DIR_COLORS文件 否则自动补全时候选菜单中的选项不能彩色显示
[ -f /etc/DIR_COLORS ] && eval $(dircolors -b /etc/DIR_COLORS)
export ZLSCOLORS="${LS_COLORS}"
zmodload zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

compdef pkill=kill
compdef pkill=killall
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:processes' command 'ps -au$USER'

# Group matches and Describe
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m'
zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'


##行编辑高亮模式 {{{ # Ctrl+@ 设置标记，标记和光标点之间为 region 
zle_highlight=(region:bg=magenta #选中区域 
				special:bold #特殊字符  
				isearch:underline) #搜索时使用的关键字 
#}}}

#[Esc][h] man 当前命令时，显示简短说明 
alias run-help >&/dev/null && unalias run-help
autoload run-help

#命令别名
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

#go语言
alias gb='go build -gcflags "-N -l"'
alias gr='go run'

unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
	alias ls='ls -F --color=auto' 
else 
	alias ls='ls -G'
fi
alias ll='ls -l'
alias grep='grep --color=auto' 

alias infogeeker='ssh root@114.215.173.43'
alias dlj_remote_145='ssh root@121.40.26.238'
alias dlj_local_252='ssh dlj@192.168.1.252'
alias linode='ssh root@139.162.44.28'
alias cpa='ssh root@120.25.81.203'

#alias '..'='cd ..'
#alias -g ...='cd ../..'
#alias -g ....='cd ../../..'
#alias -g .....='cd ../../../..'
alias d='dirs -v'
alias 'dirs'='dirs -v'
alias cbmake='rm -rf CMakeCache.txt;cmake .;make' 
alias cbsvn='svn ci -m 'fix'' 
alias cbgit='git commit -a -m 'fix';git push' 
alias chfjx='git checkout fjx@developer'
alias chmaster='git checkout master'
alias cdv1='cd /opt/prj/btclass/servers/server-api-v1/'
alias node='node --harmony'
alias node-dev='node-dev --harmony'
alias vi='vim'
alias .gdb="gdb -x ~/.config/gdb.config "
c() {
	cd "$@" ; ll
}
..() {
	cd ..;ll
}
...() {
	cd ../..;ll
}
....() {
	cd ../../..;ll
}
.....(){
	cd ../../../..;ll
}
......(){
	cd ../../../../..;ll
}
gp() {
	grep -n -H "$@" *.*
}

#路径别名 进入相应的路径时只要 cd ~xxx
hash -d cb="/home/cb/"
hash -d bt="/opt/prj/btclass/servers/"
hash -d www="/usr/local/nginx/html/"

setopt extended_glob

#PROMPT=' %B%F{red}>> %f'
#RPROMPT='%B%F{black}%~%{^[[40m%}@%{^[[10m%}@%n'
#RPROMPT='@%{[10m%}%n' 

#快速进入sudo,两下ESC
sudo-command-line() {
	[[ -z $BUFFER ]] && zle up-history
	[[ $BUFFER != sudo\ * ]] && BUFFER="sudo $BUFFER"
	zle end-of-line
}
zle -N sudo-command-line
bindkey "\e\e" sudo-command-line

#export GOPATH=~/Codes/Go/addin/:~/Codes/Go/
export PATH=$PATH:~/Codes/Go/addin/bin:/usr/local/mysql/bin/

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
