# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

autoload -U colors && colors

autoload -Uz vcs_info
zstyle ':vcs_info:*' stagedstr '%F{green}●'
zstyle ':vcs_info:*' unstagedstr '%F{yellow}●'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r'
zstyle ':vcs_info:git*' formats "%{$fg[grey]%}%s %{$reset_color%}%r%{$fg[grey]%} %{$fg[blue]%}%b%{$reset_color%}%m%u%c%{$reset_color%} "
zstyle ':vcs_info:svn*' formats "%{$fg[grey]%}%s %{$reset_color%}%b%F{1}"
#zstyle ':vcs_info:git*' actionformats "%s  %r/%S %b %m%u%c "
zstyle ':vcs_info:*' enable git svn


# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="bira"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git pip sudo supervisor wd vagrant)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/jvm/java-8-oracle/bin:/usr/lib/jvm/java-8-oracle/db/bin:/usr/lib/jvm/java-8-oracle/jre/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

alias grep='grep --color=auto --exclude-dir={.svn,.git} --exclude={*.pyc,*~,*.pyo'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias grep='grep --color=auto --exclude-dir=".svn"'

# some more ls aliases
export LS_OPTIONS="--hide=*.pyc --group-directories-first --color=auto"
LS_OPTIONS=" --hide='*.pyc' --group-directories-first --color=auto"
alias ls="ls --color=auto ${LS_OPTIONS}" 
alias ll="ls -hlF $LS_OPTIONS"
alias la="ls -hA $LS_OPTIONS"
alias l="ls -hCF $LS_OPTIONS"
alias hs='history | grep '
alias clean_vim_temp='find . -name "*~" -exec rm {} \;'

alias Update='sudo apt-get update'
alias Upgrade='sudo apt-get dist-upgrade'
alias Clean='sudo apt-get autoremove && sudo apt-get autoclean && sudo apt-get clean'
alias Remove='sudo apt-get purge'
alias Install='sudo apt-get install'
alias Restart='sudo shutdown -r now'
alias Poweroff='sudo shutdown -h now'
alias Editaliases='gedit ~/.bashrc'

CURRENT_BG='NONE'
SEGMENT_SEPARATOR='⮀'

# Begin a segment
# Takes two arguments, background and foreground. Both can be omitted,
# rendering default background/foreground.
prompt_segment() {
  local bg fg
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    echo -n " %{$bg%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{$fg%} "
  else
    echo -n "%{$bg%}%{$fg%} "
  fi
  CURRENT_BG=$1
  [[ -n $3 ]] && print -Pn $3

}

# End the prompt, closing any open segments
prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    echo -n " %{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
    echo -n "%{%k%}"
  fi
  echo -n "%{%f%}"
  CURRENT_BG=''
}

function build_prompt {
  prompt_segment black default '%(1?;%{%F{red}%}✘ ;)%(!;%{%F{yellow}%}⚡ ;)%(1j;%{%F{cyan}%}%j⚙ ;)%{%F{blue}%}%n%{%F{red}%}@%{%F{green}%}%M'
  prompt_segment blue black '%2~'
  if $git_status; then
    prompt_segment green black '${(e)git_info[prompt]}${git_info[status]}'
  fi
  prompt_end
}


fg_green=$'%{\e[0;32m%}'
fg_blue=$'%{\e[0;34m%}'
fg_cyan=$'%{\e[0;36m%}'
fg_red=$'%{\e[0;31m%}'
fg_brown=$'%{\e[0;33m%}'
fg_purple=$'%{\e[0;35m%}'
fg_light_gray=$'%{\e[0;37m%}'
fg_dark_gray=$'%{\e[1;30m%}'
fg_light_blue=$'%{\e[1;34m%}'
fg_light_green=$'%{\e[1;32m%}'
fg_light_cyan=$'%{\e[1;36m%}'
fg_light_red=$'%{\e[1;31m%}'
fg_light_purple=$'%{\e[1;35m%}'
fg_no_colour=$'%{\e[0m%}'

fg_white=$'%{\e[1;37m%}'
fg_black=$'%{\e[0;30m%}'


lb="%{$fg_light_blue%}[%{$fg_no_colour%}"
rb="%{$fg_light_blue%}]%{$fg_no_colour%}"

purple_host="%{$fg_purple%}%M%{$fg_dark_gray%}"
purple_user="%{$fg_purple%}%n%{$fg_dark_gray%}"
green_pwd="%{$fg_green%}%~%{$fg_dark_gray%}"
orange_time="%{$fg_brown%}%*%{$fg_dark_gray%}"

export TERM=xterm-256color
[ -n "$TMUX" ] && export TERM=screen-256color

#function prompt_char {
#    git branch >/dev/null 2>/dev/null && echo '±' && return
#    hg root >/dev/null 2>/dev/null && echo '☿' && return
#    echo '○'
#}
#

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}
function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    svn info >/dev/null 2>/dev/null && echo '*' && return
    echo '○'
}

precmd() {
    if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
        zstyle ':vcs_info:*' formats ' [%b%c%u%B%F{green}]'
    } else {
        zstyle ':vcs_info:*' formats ' [%b%c%u%B%F{red}●%F{green}]'
    }

#    vcs_info
    vcs_info ‘prompt’
}

setopt prompt_subst  # we do parameter expansion, command substitution and arithmetic  expansion.  See zshexpn(1).
setopt promptsubst

local venv='$(virtualenv_info)'
local cvs='%B%F{green}${vcs_info_msg_0_}%B%F{blue} %{$fg_no_colour%}'

PROMPT="%{$fg_dark_gray%}┌─[%{$purple_user%}@%{$purple_host%}:%{$green_pwd%}]─[%{$orange_time%}]
%{$fg_dark_gray%}└──> %{$fg_no_colour%}"
##PROMPT='$(build_prompt)${editor_info[keymap]}'
#RPROMPT="[%{$fg_no_bold[yellow]%}%?%{$reset_color%}]"
RPROMPT="${venv}${cvs}"
