# Shrednought ZSH Theme
# TODO:(@bigolu) the way the amp cord color gets toggled is super ineffecient and should be revised.

PROMPT='
%{$fg[gray]%}$(git_color_code ╭─)$(git_prompt_info)%n% $(host_name)%{$fg[blue]%}:%{$reset_color%}%c
$(git_color_code ╰)🎸 %{$reset_color%}'

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

# return true if git branch is clean and false otherwise
# logic borrowed from Josh Matthew's ezprompt (https://github.com/jmatth/ezprompt)
git_is_clean() {
    STATUS=`git status 2>&1 | tee`
    clean=`echo -n "${STATUS}" 2> /dev/null | grep "clean" &> /dev/null; echo "$?"`
    MODIFIED=`echo -n "${STATUS}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
    deleted=`echo -n "${STATUS}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`

    if [ "${clean}" = "0" ] && [ "${MODIFIED}" != "0" ] && [ "${deleted}" != "0" ]; then
        return 0
    else
        return 1 
    fi
}

# change color of arg based on state of git branch
git_color_code() {
    if git rev-parse --git-dir > /dev/null 2>&1; then
        if git_is_clean; then echo "%{$fg[green]%}$1%{$reset_color%}"; else echo "%{$fg[red]%}$1%{$reset_color%}"; fi
    else
        echo "%{$fg[gray]%}$1%{$reset_color%}";
    fi
}
