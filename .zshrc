# Lines configured by zsh-newuser-install
setopt appendhistory autocd
# End of lines configured by zsh-newuser-install


# customize prompts
autoload -U promptnl
autoload -Uz vcs_info
setopt prompt_subst #allow function calls in prompt
 
if [[ $UID != 0 ]]; then
        prompt_arrow=→
else
        prompt_arrow=⇒
fi
 
if [[ -z "$SSH_CLIENT" ]]; then
        prompt_host=""
else
        prompt_host=%{$fg_bold[white]%}@%{$reset_color$fg[yellow]%}$(hostname -s)
fi
 
common_fmt_prompt_pre="%{$fg[cyan]%}%n%{$fg_bold[white]%}${prompt_host}:%{$fg_bold[magenta]%}"
common_fmt_prompt_post="%{$fg[white]%}[%!]%{$fg_bold[white]%}%1(j. (%j%).)%{%(?.$fg_bold[green].$fg_bold[red])%}${prompt_arrow}%{$reset_color%} "
common_fmt_post="%{$reset_color%}"$'\n╚'"${common_fmt_prompt_pre}%S ${common_fmt_prompt_post}"
native_prompt="${common_fmt_prompt_pre}%~ ${common_fmt_prompt_post}"
 
zstyle ':vcs_info:*:prompt:*' check-for-changes true
zstyle ':vcs_info:*:prompt:*' stagedstr     "%{$fg_bold[green]●%}"
zstyle ':vcs_info:*:prompt:*' unstagedstr   "%{$fg_bold[yellow]●%}"
zstyle ':vcs_info:*:prompt:*' nvcsformats   "${native_prompt}"
zstyle ':vcs_info:*:prompt:*' branchformat  "%b"
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*:prompt:*' get-revision 'true'
 
function precmd  {
        if [[ -n "$UPDATE_PROMPT" || -n "$UPDATE_PROMPT_ONCE" ]]; then
                if [[ -z $(git ls-files --other --exclude-standard -- $(git rev-parse --show-cdup 2>/dev/null) 2>/dev/null) ]] {
                        untracked=''
                } else {
                        untracked="%{$fg_bold[red]%}●"
                }
                common_fmt_pre="╔%{$fg[red]%}%s%{$fg[white]%}:%{$fg[yellow]%}%r%{$fg[white]%}[%{$fg_bold[green]%}%b%{$fg[white]%}:%{$fg[blue]%}%i%{$reset_color$fg[white]%}] %c%u$untracked%{$reset_color%}"
 
                zstyle ':vcs_info:*:prompt:*' actionformats "${common_fmt_pre} $fg[cyan](%a) ${common_fmt_post}"
                zstyle ':vcs_info:*:prompt:*' formats       "${common_fmt_pre} ${common_fmt_post}"
 
                vcs_info 'prompt'
                UPDATE_PROMPT_ONCE=
        fi
}
 
UPDATE_PROMPT=1
faster() { UPDATE_PROMPT= }
slower() { UPDATE_PROMPT=1 }
function u {
        UPDATE_PROMPT_ONCE=1
}
 
chpwd_functions+=('u')
 
PROMPT='${vcs_info_msg_0_}'
 
setopt transient_rprompt #remove rprompt after enter
if type test >/dev/null && acpi -b 2>/dev/null | grep 'Battery 0' >/dev/null; then
        RPROMPT='[$(acpi -b | sed "s/.* \([0-9]\+\)%.*/\1/")%%] '"%(?.%{$fg_bold[green]%}:-%).%{$fg_bold[red]%}:-()%{$reset_color%}"
else
        RPROMPT="%(?.%{$fg_bold[green]%}:-%).%{$fg_bold[red]%}:-()%{$reset_color%}"
fi
SPROMPT="zsh: correct %R to %r? ([Y]es/[No]/[E]dit/[A]bort) "


alias ll="ls -l --color=auto --group-directories-first"
