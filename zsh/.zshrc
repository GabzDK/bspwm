# Path to your oh-my-zsh installation.
export ZSH="$HOME/.config/zsh/.oh-my-zsh"
export PATH=$PATH:$HOME/go/bin
source ~/.config/envman/load.sh
source ~/.config/zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh

# now load zsh-syntax-highlighting plugin
ZSH_THEME="gentoo"

zstyle ':omz:update' mode reminder  # just remind me to update when it's time

plugins=(git)

source $ZSH/oh-my-zsh.sh


# Preferred editor for local and remote sessions
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi

# Aliases

# Use neovim for vim if present.
[ -x "$(command -v nvim)" ] && alias vim="nvim" vimdiff="nvim -d"

# Use $XINITRC variable if file exists.
[ -f "$XINITRC" ] && alias startx="startx $XINITRC"

[ -f "$MBSYNCRC" ] && alias mbsync="mbsync -c $MBSYNCRC"

# sudo not required for some system commands
for command in mount umount sv pacman updatedb su shutdown poweroff reboot ; do
	alias $command="sudo $command"
done; unset command

se() {
	choice="$(find ~/.local/bin -mindepth 1 -printf '%P\n' | fzf)"
	[ -f "$HOME/.local/bin/$choice" ] && $EDITOR "$HOME/.local/bin/$choice"
	;}

# Verbosity and settings that you pretty much just always are going to want.
alias \
	cp="cp -iv" \
	mv="mv -iv" \
	rm="rm -vI" \
	bc="bc -ql" \
	rsync="rsync -vrPlu" \
	mkd="mkdir -pv" \
	yt="yt-dlp --embed-metadata -i" \
	yta="yt -x -f bestaudio/best" \
	ytt="yt --skip-download --write-thumbnail" \
	ffmpeg="ffmpeg -hide_banner"\
    z="zathura"\
    fetch="fastfetch -l small -c /home/kali/.config/fastfetch/based.jsonc"

# Colorize commands when possible.
alias \
	grep="grep --color=auto" \
	diff="diff --color=auto" \
	ccat="highlight --out-format=ansi" \
	ip="ip -color=auto"

# These common commands are just too long! Abbreviate them.
alias \
	ka="killall" \
	g="git" \
	YT="youtube-viewer" \
	sdn="shutdown -h now" \
	e="$EDITOR" \
	v="$EDITOR" \
	p="pacman" 


# get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# adding flags
alias df='df -h'               # human-readable sizes
alias free='free -m'           # show sizes in MB
alias grep='grep --color=auto' # colorize output (good for log files)

# ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'

# get error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# github
alias gl="git log --decorate=full" 
