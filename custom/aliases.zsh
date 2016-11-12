# misc
alias c="clear"
alias la="ls -A"
alias s="sudo "
alias rm='trash-put'
alias reset-spotlight='sudo mdutil -a -i off && 
  sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist && 
  sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist && 
  sudo mdutil -a -i on'

# git
alias gp="git pull"
alias gs="git status --short"
alias gss="git status"
alias gc="git commit"
alias gitall="git add -A"
alias ga="git add"

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
