# Shrednought ZSH Theme

PROMPT='
%{$fg[gray]%}$(amp_cord_1)$(git_prompt_info)%n% %{$fg[blue]%}:%{$reset_color%}$(host_name)%c
$(amp_cord_2)🎸 %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[blue]%}:%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_ADDED=""
ZSH_THEME_GIT_PROMPT_MODIFIED=""

# only show hostname if its not my computer
host_name() {
    if [ $(hostname) != "comp" ]; then
        echo "@"$(hostname)
    fi
}

git_is_clean() {
    STATUS=`git status 2>&1 | tee`
    clean=`echo -n "${STATUS}" 2> /dev/null | grep "clean" &> /dev/null; echo "$?"`

    if [ "${clean}" = "0" ]; then
        return 0
    else
        return 1 
    fi
    
}

amp_cord_1() {
    if git_is_clean $1; then echo "%{$fg[green]%}╭─%{$reset_color%}"; else echo "%{$fg[red]%}╭─%{$reset_color%}"; fi
}

amp_cord_2() {
    if git_is_clean $1; then echo "%{$fg[green]%}╰%{$reset_color%}"; else echo "%{$fg[red]%}╰%{$reset_color%}"; fi
}
