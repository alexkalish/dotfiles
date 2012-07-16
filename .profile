# Add my bin, bin/svn, postgres and ruby to the command path.
export PATH=/usr/local/bin:/Users/alexkalish/bin:/Users/alexkalish/bin/svn:/usr/local/Cellar/macvim/7.3-61/bin:$PATH

# Set default editor and pager to vim.
export EDITOR=vim

# Aliases
alias ls="ls -G"
alias la="ls -GlAh"
alias c='pbcopy'
alias p='pbpaste'
alias si="svn info"
alias ss="svn status | grep \"^[^XP]\""
alias sup="svn update"
alias gl='git l'
alias gs='git status'
alias gb='git branch'
alias gbr='git branch -r'
alias gco='git checkout'

# Source git bash autocompletion.
if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
  . /usr/local/etc/bash_completion.d/git-completion.bash
fi

# Souce script to automate running bundle exec.
source /Users/alexkalish/.bundler-exec.sh

# Set command line editing to vi.
set -o vi

# Customize Ruby GC
export RUBY_HEAP_MIN_SLOTS=50000
export RUBY_GC_MALLOC_LIMIT=50000000

# Start RVM
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# RVM Autocomplete
[[ -r $rvm_path/scripts/completion ]] && source $rvm_path/scripts/completion

# Function for getting the RVM prompt
rvm-prompt() {
  local RVM_PROMPT=`$HOME/.rvm/bin/rvm-prompt i v g`
  if [ -n "$RVM_PROMPT" ]; then
    echo "($RVM_PROMPT) "
  fi
}

export PS1='$(rvm-prompt)\w$(__git_ps1 " (%s)") \$ '
