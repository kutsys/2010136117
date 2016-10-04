# ~/.bashrc: executed by bash(1) for non-login shells.
~/.bashrc: 비로그인 쉘들을위해 bash(1)에 의해서 실행됩니다.

# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
/usr/share/doc/bash/examples/startup-files를 보세요(bash-doc package안에 있는)

# for examples
예를 들어

# If not running interactively, don't do anything
상호작용이 실행되지 않는다면 아무것도 하지 마십시오

case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
히스토리 안에 중복된 line이나 공백으로 시작하는 line을 넣지 마세요

# See bash(1) for more options
더 많은 옵션에 대해서는 bash(1)을 참고하세요

HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
히스토리 파일에 덮어쓰지 말고 추가하세요

shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
히스토리 길이 설정을 위해 bash(1) 안의 HISTSZIE와 HISTFILESIZE를 보세요

HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
각각의 명령어 이후 윈도우 사이즈를 확인하고 만약 필요하다면

# update the values of LINES and COLUMNS.
행과 열의 값을 업데이트하세요

shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
설정되었다면 패스네임 확장 문맥에 사용되는 "**" 패턴은

# match all files and zero or more directories and subdirectories.
모든 파일, 0개 또는 그 이상의 디렉토리들과 서브 디렉토리들과 일치할 것입니다.

#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
비넥스트 입력 파일들에 대해 less가 좀더 친근하게 만들기 위해 lesspipe(1)을 참고하세요

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
(프롬프트 하에 사용되는) 작업하고 있는 chroot를 식별하는 변수를 설정하세요

if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
팬시한 색을 설정하세요(만약 원하는 색이 없다면 non-color로 설정하세요)

case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
만약 터미널이 가능하다면 색이 입혀진 프롬프트에 대한 코멘트는 하지 않습니다.

# off by default to not distract the user: the focus in a terminal window
유저에게 혼란을 주지 않기 위해 기본값을 해제하세요 터미널 윈도우에서의 초점은

# should be on the output of commands, not on the prompt
프롬프트가 아닌 명령의 결과물에 있어야 합니다

#force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then

        # We have color support; assume it's compliant with Ecma-48
색상을 지원할 수 있습니다 Ecma-48과 부합하다고 가정합니다

        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
거르허나 자원의 부족은 극히 드물고, 그러한

        # a case would tend to support setf rather than setaf.)
케이스는 self보다 setaf를 지원하는 경향이 있습니다.

        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\$
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
먄약 이것이 xterm일 경우 제목을 user@host:dir로 설정하세요

case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
ls의 색 지원을 가능하게 하고, 또한 간단한 명령어도 추가하세요

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dirc$
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
더 많은 ls aliases

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
오래 실행하는 명령을 위해 "alert" 명령어를 추가하세요. 이와같이

#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || ech$

# Alias definitions.
명령어 정의

# You may want to put all your additions into a separate file like
당신은 추가 사항들을 넣고싶어할지 모릅니다.

# ~/.bash_aliases, instead of adding them here directly.
~/.bash_aliases같은 분리된 파일에 여기에 직접 그 추가 사항들을 추가하는 대신에

# See /usr/share/doc/bash-doc/examples in the bash-doc package.
bash-doc package 안에 있는 /usr/share/doc/bash-doc/examples를 보세요

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
사용가능하며 프로그래밍이 가능한 특징(당신은 이것을 사용하게 할 필요는 없습니다

# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
만일 /etc/bash.bashrc나 /etc/profile에서 사용할 수 있다면)

# sources /etc/bash.bashrc).

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi



