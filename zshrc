# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

autoload -U colors && colors

autoload -Uz vcs_info
zstyle ':vcs_info:*' stagedstr '%F{green}●'
zstyle ':vcs_info:*' unstagedstr '%F{yellow}●'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r'
# zstyle ':vcs_info:git*' formats "%{$fg[grey]%}%s %{$reset_color%}%r%{$fg[grey]%} %{$fg[blue]%}%b%{$reset_color%}%m%u%c%{$reset_color%} "
# zstyle ':vcs_info:svn*' formats "%{$fg[grey]%}%s %{$reset_color%}%b%F{1}"
#zstyle ':vcs_info:git*' actionformats "%s  %r/%S %b %m%u%c "
zstyle ':vcs_info:*' enable git svn


# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="bira"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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

# Remember about a years worth of history (AWESOME)
SAVEHIST=10000
HISTSIZE=10000

# Don't overwrite, append!
setopt APPEND_HISTORY

# Write after each command
# setopt INC_APPEND_HISTORY

# Killer: share history between multiple shells
# setopt SHARE_HISTORY

# Save the time and how long a command ran
setopt EXTENDED_HISTORY

# source $ZSH/oh-my-zsh.sh

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
export SSH_KEY_PATH="~/.ssh/id_rsa"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

#alias grep='grep --color=auto --exclude-dir={.svn,.git} --exclude={"*.pyc","*~","*.pyo"}'
RED='\033[0;31m'
NC='\033[0m' # No Color
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias docker.io='docker'
alias g='git'
# alias sg='find . -maxdepth 1 -type d -exec git --git-dir={}/.git --work-tree=$PWD/{} branch \;'
function subgit { find . -maxdepth 1 -type d -not -path "." -not -path "./.git/*" -exec printf "${RED}{}${NC}\n" \; -exec git --git-dir={}/.git --work-tree=$PWD/{} $* \; }

# some more ls aliases
export LS_OPTIONS="--hide=*.pyc --group-directories-first --color=auto"
LS_OPTIONS=" --hide='*.pyc' --group-directories-first --color=auto"
alias ls="ls --color=auto ${LS_OPTIONS}" 
alias ll="ls -hlF $LS_OPTIONS"
alias la="ls -hA $LS_OPTIONS"
alias l="ls -hCF $LS_OPTIONS"
alias hs='history | grep '
alias clean_vim_temp='find . -name "*~" -exec rm {} \;'

alias zsr=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"

alias Update='sudo apt-get update'
alias Upgrade='sudo apt-get dist-upgrade'
alias Clean='sudo apt-get autoremove && sudo apt-get autoclean && sudo apt-get clean'
alias Remove='sudo apt-get purge'
alias Install='sudo apt-get install'
alias Restart='sudo shutdown -r now'
alias Poweroff='sudo shutdown -h now'
alias Editaliases='gedit ~/.bashrc'

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
orange_time="%{$fg_brown%}%*%{$reset_color%}"

function greppy { grep -Rni "$1" --include="*.py" --color .; }
function grepxml { grep -Rni "$1" --include="*.xml" --color .; }
function grepcode { grep -Rni "$1" --exclude="*.po" --exclude="*.css" --exclude="*.js" --exclude="*.pot" --color .; }

setopt prompt_subst  # we do parameter expansion, command substitution and arithmetic  expansion.  See zshexpn(1).
setopt promptsubst
function powerline_precmd() {
    PS1="$(~/powerline-shell.py $? --shell zsh 2> /dev/null)
%{$fg[white]%} %{$reset_color%}"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi

RPROMPT="${orange_time}"

# http://stackoverflow.com/a/844299
expand-or-complete-with-dots() {
  echo -n "\e[31m...\e[0m"
  zle expand-or-complete
  zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots
export PROJECT_HOME="/home/jack/dev/clients"
source `which virtualenvwrapper.sh`

source ~/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

antigen bundle git
antigen bundle pip
antigen bundle sudo
antigen bundle supervisor
antigen bundle wd
antigen bundle vagrant
# antigen bundle bower
antigen bundle ssh-agent
antigen bundle zsh-users/zsh-syntax-highlighting

# antigen bundle kennethreitz/autoenv
antigen bundle joshuamorton/autoenv

antigen apply
