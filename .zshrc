#
# $URL: file:///home/ryo/svn/zshconf/trunk/dot.zshrc $
# $Id: dot.zshrc 9 2008-06-15 06:02:40Z ryo $

echo "Loading $HOME/.zshrc"

### shell variables

# ZDOTDIR は zsh の個人用設定ファイルを探すディレクトリを指定する

if [ -z $ZDOTDIR ]; then
  export ZDOTDIR=$HOME
fi


# zsh が使うシェル変数のうちヒストリ（履歴機能）に関するもの

HISTFILE=$ZDOTDIR/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
if [ $UID = 0 ]; then
    unset HISTFILE
    SAVEHIST=0
fi
setopt hist_ignore_dups # ignore duplication command history list
setopt share_history # share command history data


# 自分以外のユーザのログイン・ログアウトを表示するようになる

WATCH=notme

# core ファイルのサイズを 0 に抑制する
unlimit
limit core 0
limit -s

# ファイル作成時のデフォルトのモードを指定する
umask 022


### key bindings

# zsh のキーバインドを環境変数 EDITOR に関わらず emacs 風にする

bindkey	-e
#bindkey -v                              # EDITOR=vi -> bindkey -v
autoload -U	up-line-or-beginning-search
zle	-N	up-line-or-beginning-search
bindkey	"^P"	up-line-or-beginning-search

autoload -U	down-line-or-beginning-search
zle	-N	down-line-or-beginning-search
bindkey	"^N"	down-line-or-beginning-search


## 以下、見通しを良くするために複数ファイルに切り分けて include している ##
## （$ZUSERDIR は .zprofile で指定）                                     ##
#
# $URL: file:///home/ryo/svn/zshconf/trunk/dot.zprofile $
# $Id: dot.zprofile 9 2008-06-15 06:02:40Z ryo $
#
### Select OS type

case $OSTYPE {
  sunos*)	export SYSTEM=sun ;;
  solaris*)	export SYSTEM=sol ;;
  irix*)	export SYSTEM=sgi ;;
  osf*)		export SYSTEM=dec ;;
  linux*)	export SYSTEM=gnu ;;
  freebsd*)	export SYSTEM=bsd ;;
  darwin*)	export SYSTEM=darwin ;;    # MacOSX
}

# 切り分けた設定ファイルを読み込むディレクトリを指定する

export ZUSERDIR=$ZDOTDIR/.zsh


### System specific environment

# 環境変数（PATH など）の OS 別設定ファイルを読み込む

if [ -f $ZUSERDIR/zshrc.$SYSTEM ]; then
  source $ZUSERDIR/zshrc.$SYSTEM
fi

# man path
export MANPATH="/usr/share/man:/usr/X11R6/man:/usr/local/man:/var/qmail/man:$HOME/man:."



### zsh options

# zsh そのものの動作を指定するオプションの設定

if [ -f $ZUSERDIR/zshoptions ]; then
  source $ZUSERDIR/zshoptions
fi


### completions

# 補完の設定を行う compctl の設定ファイルを読み込む

if [ -f $ZUSERDIR/completions ]; then
  source $ZUSERDIR/completions
fi

# see $fpath
autoload -U compinit 
compinit

### aliases

# コマンドに別名をつける alias の設定ファイルを読み込む

if [ -f $ZUSERDIR/aliases ]; then
  source $ZUSERDIR/aliases
fi


### functions

# 複雑な機能を実現する関数 function の設定ファイルを読み込む

if [ -f $ZUSERDIR/functions ]; then
  source $ZUSERDIR/functions
fi


### color ls

# 色つき ls の設定ファイルを読み込む

if [ -f $ZUSERDIR/lscolors ]; then
  source $ZUSERDIR/lscolors
#  alias ll='ls -lAF --color=tty'
fi

### User environment

# ユーザ独自の設定ファイルがあれば読み込む

if [ -f $ZUSERDIR/zshrc.user ]; then
  source $ZUSERDIR/zshrc.user
fi
