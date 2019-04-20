#
# $URL: file:///home/ryo/svn/zshconf/trunk/dot.zshenv $
# $Id: dot.zshenv 11 2008-07-11 05:49:32Z ryo $

# comment for rsync auto login.
#echo "Loading $HOME/.zshenv"

### env

# prompt

#PROMPT="%n@%l'%U%m%u[`jobcount()`]:%4~%# "
PROMPT="%n@%l'%U%m%u[0]:%4~%# "

autoload colors
colors
#PROMPT="%B%n%b@%l'%U%m%u[0]:%4~%{${fg[blue]}%}%#%{${reset_color}%} "

RPROMPT='   %D{%Y.%m.%d %a %H:%M:%S}'

#SPROMPT='zsh: correct '\''%R'\'' to '\''%r'\'' [nyae]? '
SPROMPT='zsh: replace '\''%R'\'' to '\''%r'\'' ? [Yes/No/Abort/Edit] '

# root attention.
if [ $UID = 0 ]; then
	PROMPT="%BROOT%b@%l'%U%m%u[0]:%4~%# "
#                     %n@%l'%U%m%u[0]:%4~%#
fi

# set default
PROMPT_DEFAULT="$PROMPT"
RPROMPT_DEFAULT="$RPROMPT"

# for X client
#DISPLAY="192.168.0.210:0.0"

# term
#TERM=vt100
TERM=xterm
#TERM=xterm-color

# mail
#MAILPATH=$HOME/Maildir
#MAILCHECK=120

# surpress perl warnings
export PERL_BADLANG=0
export PERLDOC_PAGER=${PAGER}

### path setting

path=(/bin /sbin /usr/bin /usr/sbin /usr/local/bin /usr/local/sbin)
path=($path /usr/libexec /usr/local/libexec)
path=($path $HOME/bin)

path=($path /usr/local/sysutil)
path=($path /usr/ucb /usr/etc)	# for SunOS

