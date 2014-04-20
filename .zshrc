#
# /etc/zshrc is sourced in interactive shells.  It
# should contain commands to set up aliases, functions,
# options, key bindings, etc.
#

umask 077

autoload -U compinit
compinit

# Functions

############################################################
# Set different prompts for different systems
# Setprompt inspired by http://aperiodic.net/phil/prompt/
############################################################
setprompt () {
    ###
    # Need this so the prompt will work.
    setopt prompt_subst

    ###
    # See if we can use colors.

    autoload colors zsh/terminfo
    if [[ "$terminfo[colors]" -ge 8 ]]; then
	colors
    fi
    for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
	eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
	eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
	(( count = $count + 1 ))
    done
    PR_NO_COLOUR="%{$terminfo[sgr0]%}"

		OSNAME=`uname -s`

		if [[ "$OSNAME" == "Darwin" ]]; then
			PROMPT='[%*] $PR_SHIFT_IN$PR_BLUE$PR_SHIFT_OUT%n@%m$PR_NO_COLOUR
%~%# '
		elif [[ "$OSNAME" == "Linux" ]]; then
			if lsb_release -i | grep -q Debian ; then
				PROMPT='[%*] $PR_SHIFT_IN$PR_CYAN$PR_SHIFT_OUT%n@%m$PR_NO_COLOUR
%~%# '
			else
				PROMPT='[%*] $PR_SHIFT_IN$PR_GREEN$PR_SHIFT_OUT%n@%m$PR_NO_COLOUR
%~%# '
			fi
		fi

}

# Set up colors for ls: MAC OS X Specific Stuff
export CLICOLORS=1
# Enable ls colors
# Edited - S.M. Changed ls -G -> ls --color. Requires dircolor to be valid.
if [ "$DISABLE_LS_COLORS" != "true" ]
then
	# Find the option for using colors in ls, depending on the version: Linux or BSD
	ls --color -d . &>/dev/null 2>&1 && alias ls='ls --color=tty' || alias ls='ls -FG'
fi

# Set up aliases
alias mv='nocorrect mv'       # no spelling correction on mv
alias cp='nocorrect cp'       # no spelling correction on cp
alias mkdir='nocorrect mkdir' # no spelling correction on mkdir

alias vi=vim

export HISTFILE=~/.zhistory
export SAVEHIST=9999999
export PATH=/opt/local/bin:/usr/lib/ruby/gems/1.8/bin:$PATH:/usr/local/mysql/bin:$HOME/bin

## zsh options
setopt inc_append_history
setopt hist_ignore_all_dups
setopt extendedglob
setopt auto_cd
setopt auto_list
setopt no_auto_menu
setopt auto_param_slash
setopt auto_remove_slash
setopt correct
setopt extended_history
setopt hist_no_store
setopt hist_reduce_blanks
setopt hist_ignore_space
setopt hist_verify
setopt hup
setopt multios
setopt no_beep
setopt nopromptcr
setopt interactive_comments

# reloads zsh
alias reload="exec $SHELL"

# Set prompts
setprompt
# PS1='[%*] %n@%m
# %~%# '
# PROMPT='%m%# '    # default prompt
#RPROMPT=' %~'     # prompt for right side of screen

# Some environment variables
export HOSTNAME=`/bin/hostname`
export MAIL=/var/spool/mail/$USER
export IPOD_MOUNTPOINT=/media/IPOD
export PERL5LIB=~/lib/
export VISUAL=`which vim`
export EDITOR=`which vim`

# Looks like this isn't necessary after declaring $PATH earlier:
# path=(/opt/local/bin/ $path /usr/local/mysql/bin $HOME/bin)

bindkey -v             # vi key bindings
# bindkey -e             # emacs key bindings
bindkey ' ' magic-space  # also do history expansino on space

# RVM - Ruby Version Manager
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 
