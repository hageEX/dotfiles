#========================================
#           _
#    _______| |__  _ __ ___
#   |_  / __| '_ \| '__/ __|
#  _ / /\__ \ | | | | | (__
# (_)___|___/_| |_|_|  \___|
#
#========================================
# Nerd-fonts = 16pt Literation Mono Nerd Font Complete.
# vim: ft=zsh

#おまじない
autoload -Uz compinit && compinit
autoload -Uz color
autoload -Uz vcs_info

precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT='%F{yellow}⏾%f%F{cyan}%K{clear} %D{%m/%d(%a)}  %D{%H:%M}%f%k'
zstyle ':vcs_info:git:*' formats '%F{50}%K{black}  %f%F{117}%b %k%f'
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "+"
zstyle ':vcs_info:git:*' unstagedstr "-"
zstyle ':vcs_info:git:*' actionformats '(%s)-[%b|%a] %c%u'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

# old color 40, 46, 10, 149

PROMPT='%F{50}╭%f%F{cyan}%K{16} root@MacBookPro %k%f%F{16}%K{cyan}%k%f%F{16}%K{cyan}  %c%k%f%F{cyan} %f %F{34}%f$vcs_info_msg_0_%F{34}%f
%F{50}╰─%f%F{44}%f%F{117}%f '


# parrot風プロンプト
#PROMPT='%F{red}┌─[%f%F{46}%n%f%F{226}@%f%F{50}parrot%F{red}]─%f%f%F{red}[%f%F{green}%~%f%F{red}]
#└──╼%f%F{226} $%f '
#RPROMPT='%F{red}[%f%F{yellow}⏾%f%F{green}%K{clear} %D{%m/%d(%a)}%F{red}]─[%f%F{46} %D{%H:%M}%f%k%F{red}]%f'

# parrto Terminal
# fg=#090EA1 bg=#729FCF

# カラフルプロンプト
#PROMPT='%F{1}us%f%F{178}er%f%F{11}@%f%F{2}x%f%F{4}x%f%F{53}x%f:%F{101}[%f%F{030}%~%f%F{101}]%f
#%F{215}   ❨%f%F{020}◈%f%F{215} ❩ %f '


#  %F{220}%f  %F{124}%f
#   ± ●
#


# PROMPTで使えるカラーを取得するコマンド
# for c in {000..255}; do echo -n "\e[38;5;${c}m $c" ; [ $(($c%16)) -eq 15 ] && echo;done;echo

######プラグインインストール######
# zplugが無ければgitからclone
if [[ ! -d ~/.zplug ]];then
  git clone https://github.com/zplug/zplug ~/.zplug
fi

# zplugを使う
source ~/.zplug/init.zsh
# zplug "ユーザー名/リポジトリ名", タグ

# 補完を更に強化する
zplug "zsh-users/zsh-completions"
# タイプ補完
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "chrissicool/zsh-256color"
# 入力途中に候補をうっすら表示
zplug "zsh-users/zsh-autosuggestions"
# コマンドを種類ごとに色付け
zplug "zsh-users/zsh-syntax-highlighting", defer:3
# ヒストリの補完を強化する
zplug "zsh-users/zsh-history-substring-search", defer:3
# 自分自身をプラグインとして管理
zplug "zplug/zplug", hook-build:'zplug --self-manage'
# 本体（連携前提のパーツ）
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf
zplug "junegunn/fzf", as:command, use:bin/fzf-tmux
# fzf でよく使う関数の詰め合わせ
zplug "mollifier/anyframe"
# ディレクトリ移動を高速化（fzf であいまい検索）
zplug "b4b4r07/enhancd", use:init.sh
# git のローカルリポジトリを一括管理（fzf でリポジトリへジャンプ）
zplug "motemen/ghq", as:command, from:gh-r
#プロンプトカスタマイズ
#zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme

# インストールしていないプラグインをインストール
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
# コマンドをリンクして、PATH に追加し、プラグインは読み込む
zplug load

######プラグインセッティング######
#zsh-syntax-highlighting
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=160
ZSH_HIGHLIGHT_STYLES[command]=fg=34
ZSH_HIGHLIGHT_STYLES[default]=none
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=yellow
ZSH_HIGHLIGHT_STYLES[alias]=fg=green
ZSH_HIGHLIGHT_STYLES[builtin]=fg=green
ZSH_HIGHLIGHT_STYLES[function]=fg=green
ZSH_HIGHLIGHT_STYLES[precommand]=fg=green,underline
ZSH_HIGHLIGHT_STYLES[commandseparator]=none
ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=green
ZSH_HIGHLIGHT_STYLES[path]=underline
ZSH_HIGHLIGHT_STYLES[path_prefix]=underline
ZSH_HIGHLIGHT_STYLES[path_approx]=fg=yellow,underline
ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=yellow
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=cyan
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=cyan
ZSH_HIGHLIGHT_STYLES[assign]=none

######基本設定######
#補完候補を一覧表示する
setopt auto_list
#TABで候補を選択する
setopt auto_menu
#補完候補をTABや矢印で選択できるようにする
zstyle ':completion:*:default' menu select=1
#補完候補の配色
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
#cd時、PATHを直打ちで移動可能に。
setopt auto_cd
#移動したディレクトリを記録しておく
setopt auto_pushd
#補完候補表示時などにビープ音をならないように設定
setopt nolistbeep
#打ち間違いをに対応
setopt correct
#historyファイルを作って、そこから過去のコマンドも実行可能に
export LANG=ja_JP.UTF-8
export HISTFILE=$HOME/.zsh-history
export HISTSIZE=1000
export SAVEHIST=10000
#重複を記録しない
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_save_no_dups
#既に作成された重複を履歴から取り除く
sort -t ";" -k 2 -u ~/.zsh-history | sort -o ~/.zsh-history
#開始と終了を記録
setopt EXTENDED_HISTORY
#複数のターミナル間で履歴を共有する
setopt share_history
setopt no_beep
#補完関連
setopt auto_list
setopt auto_menu
# / を自動的に付加し、次の補完に備える
setopt auto_param_slash

### 補完方法毎にグループ化する。
zstyle ':completion:*' format '%B%F{blue}%d%f%b'
zstyle ':completion:*' group-name ''
### 補完侯補をメニューから選択する。
### select=2: 補完候補を一覧から選択する。補完候補が2つ以上なければすぐに補完する。
zstyle ':completion:*:default' menu select=2
### 補完候補に色を付ける。
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
### 補完候補がなければより曖昧に候補を探す。
### m:{a-z}={A-Z}: 小文字を大文字に変えたものでも補完する。
### r:|[._-]=*: 「.」「_」「-」の前にワイルドカード「*」があるものとして補完する。
#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[._-]=*'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' keep-prefix
zstyle ':completion:*' recent-dirs-insert both
### 補完候補
### _oldlist 前回の補完結果を再利用する。
### _complete: 補完する。
### _match: globを展開しないで候補の一覧から補完する。
### _history: ヒストリのコマンドも補完候補とする。
### _ignored: 補完候補にださないと指定したものも補完候補とする。
### _approximate: 似ている補完候補も補完候補とする。
### _prefix: カーソル以降を無視してカーソル位置までで補完する。
#zstyle ':completion:*' completer _oldlist _complete _match _history _ignored _approximate _prefix
zstyle ':completion:*' completer _complete _ignored
## 補完候補をキャッシュする。
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path ~/.zsh/cache
## 詳細な情報を使わない
zstyle ':completion:*' verbose no

alias vi='vim'
alias ll='ls -hl'
alias lla='ls -hla'
alias l='ls -GF'
alias ls='ls -GF'
#alias l='ls --color=auto'
#alias ls='ls --color=auto'
alias la='ls -a'
alias c='clear'
alias cl='clear'
alias p='python'
alias ascii='asciiConvert'
alias du='du -hs'
alias df='df -h'
alias ..='cd ..'
alias g='grep'
alias op='open -a'
alias his='history'
alias eman='LANG=C man'
alias gf='grep -F'
alias home='cd ~'
alias reload='exec $SHELL -l'
alias apt='sudo apt'
alias pip-update='pip freeze --local | grep -v '^\-e' | cut -d = -f 1 | xargs pip install -U pip'
alias pip3-update='pip3 freeze --local | grep -v '^\-e' | cut -d = -f 1 | xargs pip3 install -U pip'
# +---|-----+
# | # | Git |
# +===|=====+
alias sta="git status"
alias add="git add"
alias comi="git commit"
alias greset="git reset"
alias glog="git log"
alias show="git show"
alias bran="git branch"
alias pull="git pull"
alias push="git push"
alias ginit="git init"
alias clone="git clone"
alias gmv="git mv"
alias grm="git rm"
alias fetch="git fetch"
alias remote="git remote"
alias cout="git checkout"
alias ggrep="git grep"
alias gclean="git clean"
alias gdiff="git diff"
### Linux Open Command
# alias open='xdg-open'
### Linux Open Command(GNOME)?
# alias open='gnome-open'

# +---|-----------+
# | # | Rust PATH |
# +---|-----------+
export PATH="$HOME/.cargo/bin:$PATH"
# +---|-------------------------------+
# | # | added by Miniconda3 installer |
# +---|-------------------------------+
export PATH="$HOME/miniconda3/bin:$PATH"
# Python3 PATH
# export PYTHONPATH='/usr/bin/python3$PYTHONPATH'
# +---|-------------+
# | # | golang PATH |
# +---|-------------+
export GOPATH=$HOME/dev/go/
export PATH=$PATH:$GOPATH/bin
#export PATH=$PATH:/usr/local/bin/go
# +---|-------------------------------+
# | # | Internet Search from terminal |
# +---|-------------------------------+
net(){
    if [ $(echo $1 | egrep "^-[cfs]$") ]; then
        local opt="$1"
        shift
    fi
    local url="https://www.google.co.jp/search?q=${*// /+}"
#    local url="https://duckduckgo.com/?q=${*// /+}&t=ffab&ia=web"
    local app="/Applications"
    local c="${app}/chrome+.app"
    local f="${app}/Firefox.app"
    local s="${app}/Safari.app"
    case ${opt} in
        "-c")   open "${url}" -a "$c";;
        "-f")   open "${url}" -a "$f";;
        "-s")   open "${url}" -a "$s";;
        *)      open "${url}";;
    esac
}

#Homebrewの情報収集を停止させる
export HOMEBREW_NO_ANALYTICS=1
#Terminalから行う場合は以下のコマンド
#brew analytics off
