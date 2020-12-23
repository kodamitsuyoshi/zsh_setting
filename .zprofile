
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
#export  MACHINE_STORAGE_PATH="/Volumes/KodaSSD/workdir/.docker/machine"
#export PATH="$PATH:$HOME/.cargo/bin"

export PATH="/usr/local/bin:$PATH"


export PYENV_ROOT="$HOME/.pyenv"
export PATH=${PATH}:${PYENV_ROOT}/shims
export PATH="$PYENV_ROOT/bin:$PATH"
#export PATH=$HOME/.composer/vendor/bin:$PATH
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


#exec "$SHELL"

#if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH="/usr/local/sbin:$PATH"


#PROMPT='
#%F{green}%(5~,%-1~/.../%2~,%~)%f
#%F{green}%B$%b%f'


# -------------------------------------------------
# alias
# -------------------------------------------------
alias vagrant_recreate='vagrant halt && vagrant destroy -f && vagrant up'

# --------------------------------------------------
#  コマンド入力補完
# --------------------------------------------------

# 補完機能有効にする
autoload -U compinit
compinit -u

# 補完候補に色つける
autoload -U colors
colors
zstyle ':completion:*' list-colors "${LS_COLORS}"

# 単語の入力途中でもTab補完を有効化
setopt complete_in_word
# 補完候補をハイライト
zstyle ':completion:*:default' menu select=1
# キャッシュの利用による補完の高速化
zstyle ':completion::complete:*' use-cache true
# 大文字、小文字を区別せず補完する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 補完リストの表示間隔を狭くする
setopt list_packed

#補完候補を一覧表示にする
setopt auto_list
#TAB で順に補完候補を切り替える
setopt auto_menu

# コマンドの打ち間違いを指摘してくれる
setopt correct
SPROMPT="correct: $RED%R$DEFAULT -> $GREEN%r$DEFAULT ? [Yes/No/Abort/Edit] => "

# --------------------------------------------------
#  $ cd 機能拡張
# --------------------------------------------------

# cdを使わずにディレクトリを移動できる
setopt auto_cd
# $ cd - でTabを押すと、ディレクトリの履歴が見れる
setopt auto_pushd

alias tree="pwd;find . | sort | sed '1d;s/^\.//;s/\/\([^/]*\)$/|--\1/;s/\/[^/|]*/| /g'"


# --------------------------------------------
# $ history
# -------------------------------------------

export LANG=ja_JP.UTF-8
HISTFILE=$HOME/.zsh-history
HISTSIZE=1000000
SAVEHIST=1000000
#ついでに、複数のターミナルを開いているときに
#他のターミナルで実行したコマンドも使えるようにしておきます。
setopt share_history

