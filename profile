# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$PATH:$HOME/.local/bin"
fi
if [ -d "$HOME/.dotfiles/bin" ] ; then
    PATH="$PATH:$HOME/.dotfiles/bin"
fi

PATH="$PATH:/opt/node-v5.0.0-linux-x64/bin/"

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export TERMINAL="/usr/bin/roxterm"
export EDITOR="/usr/bin/vi"
#
# if [ $XDG_CURRENT_DESKTOP="i3" ]; then
#   export XDG_CURRENT_DESKTOP="GNOME"
# fi
