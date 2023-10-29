alias ls='ls --color=auto'
alias l="ls -CF"
alias ll="ls -aLF"
alias la="ls -A"
alias lsd="ls -d */ | lolcat"

alias v="vim"
alias nv="nvim"

alias sl="sl | lolcat"

alias lsbat="cat /sys/class/power_supply/BAT0/capacity | lolcat" # show battery percentage

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias cat='bat'
alias ccat='cat'

alias df='df -h'

#alias whichvga="/usr/local/bin/arcolinux-which-vga" # which graphical card is working

alias free="free -mt"

alias wget="wget -c" # always continue download

#alias vbm="sudo /usr/local/bin/arcolinux-vbox-share" # mounting the folder Public for exchange between host and guest on virtualbox

# youtube download
alias yta-aac="yt-dlp --extract-audio --audio-format aac "
alias yta-best="yt-dlp --extract-audio --audio-format best "
alias yta-flac="yt-dlp --extract-audio --audio-format flac "
alias yta-mp3="yt-dlp --extract-audio --audio-format mp3 "
alias ytv-best="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 "

# recent installed packages
#alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
#alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"

#alias iso="cat /etc/dev-rel | awk -F '=' '/ISO/ {print $2}'" # iso and version used to install arcolinux

#alias cleanup='sudo pacman -Rns $(pacman -Qtdq)' # cleanup orphaned packages

#alias listaur="sudo pacman -Qqem" # list of AUR packages

alias jctl="journalctl -p 3 -xb" # get the error messages from journalctl

# give the list of all installed desktops - xsessions desktops
alias xd="ls /usr/share/xsessions"

