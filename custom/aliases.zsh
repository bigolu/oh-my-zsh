# misc
alias c="clear"
alias wifi"sudo service network-manager restart"
alias la="ls -A"
alias s="sudo "
alias rm='trash-put'

# git
alias gs="git status --short"
alias gss="git status"
alias gc="git commit"
alias gitall="git add -A"
alias ga="git add"

# apt-get
alias aptdate='sudo apt-get update'
alias aptgrade='sudo apt-get upgrade'
alias aptstall='sudo apt-get install'
alias aptautorm='sudo apt-get autoremove'
alias aptrm='sudo apt-get remove'
alias aptsearch='apt-cache search'

# perform 'ls' after 'cd' if successful.
cdls() {
  builtin cd "$*"
  RESULT=$?
  if [ "$RESULT" -eq 0 ]; then
    ls
  fi
}
alias cd='cdls'

# disk space/usage (-h converts bytes to mb/gb)
alias df='df -h'
alias du='du -h'
