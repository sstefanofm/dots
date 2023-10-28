#
# interactive mode only

[[ $- != *i* ]] && return

#
# env

export EDITOR='vim'
export VISUAL="$EDITOR"
export HISTCONTROL=ignoreboth:erasedups
export PAGER='less'

# colored man pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

#
# PS1

if [ "`id -u`" -eq 0 ]; then # root user
    PS1="\[\e[1;31m\]\u\[\e[1;36m\]\[\033[m\]@\[\e[1;36m\]\h\[\033[m\]\[\e[0m\]\[\e[1;31m\][\w]\[\e[1;34m\]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')\[\e[1;37m\]\n$ \[\e[0m\]"
else
    PS1="\[\e[1m\]\u\[\e[1;36m\]\[\033[m\]@\[\e[1;36m\]\h\[\033[m\]\[\e[0m\]\[\e[1;31m\][\w]\[\e[1;34m\]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')\[\e[1;37m\]\n$ \[\e[0m\]"
fi

#
# PATH

PATH="$HOME/.bin:$PATH"

#
# KERNEL DEV

export PREFIX="$HOME/opt/cross"
export TARGET=i686-elf
export PATH="$PREFIX/bin:$PATH"

#
# ignore case when using TAB

bind "set completion-ignore-case on"

#
# functions

pacdep() { # show package dependencies
  search=$(echo "$1")
  sudo pacman -Sii $search | grep "Required" | sed -e "s/Required By     : //g" | sed -e "s/  /\n/g"
}

ex () { # extractor for all kinds of archives
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   tar xf $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

#
# aliases

alias ls='ls --color=auto'
alias l="ls -A | grep -E '^\.' | lolcat"
alias lsd="ls -d */ | lolcat"

alias v="vim"
alias nv="nvim"

alias sl="sl | lolcat"

alias lsbat="cat /sys/class/power_supply/BAT0/capacity | lolcat" # show battery percentage

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias df='df -h'

alias whichvga="/usr/local/bin/arcolinux-which-vga" # which graphical card is working

alias free="free -mt"

alias wget="wget -c" # always continue download

alias vbm="sudo /usr/local/bin/arcolinux-vbox-share" # mounting the folder Public for exchange between host and guest on virtualbox

# youtube download
alias yta-aac="yt-dlp --extract-audio --audio-format aac "
alias yta-best="yt-dlp --extract-audio --audio-format best "
alias yta-flac="yt-dlp --extract-audio --audio-format flac "
alias yta-mp3="yt-dlp --extract-audio --audio-format mp3 "
alias ytv-best="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 "

# recent installed packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"

alias iso="cat /etc/dev-rel | awk -F '=' '/ISO/ {print $2}'" # iso and version used to install arcolinux

alias cleanup='sudo pacman -Rns $(pacman -Qtdq)' # cleanup orphaned packages

alias listaur="sudo pacman -Qqem" # list of AUR packages

alias jctl="journalctl -p 3 -xb" # get the error messages from journalctl

# give the list of all installed desktops - xsessions desktops
alias xd="ls /usr/share/xsessions"
alias xdw="ls /usr/share/wayland-sessions"
