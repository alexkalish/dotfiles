# Put homebrew at the beginning of my path.
export PATH="/usr/local/bin:$PATH"

# Add local bin to the path.
export PATH="$PATH:$HOME/bin"

# Set default editor and pager to vim.
export EDITOR=vim

# Source git bash autocompletion.
if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
  . /usr/local/etc/bash_completion.d/git-completion.bash
fi 
# Source git bash ps1.
if [ -f /usr/local/etc/bash_completion.d/git-prompt.sh ]; then
  . /usr/local/etc/bash_completion.d/git-prompt.sh
fi 

export GIT_PS1_SHOWDIRTYSTATE=true

# Set command line editing to vi.
set -o vi

# Function to call Marked.app from the command line.
function marked {
  if [ $1 ] ; then
    open -a marked.app $1
  else
    open -a marked.app
  fi
}

# Function to quickly remove all vim temp files.
function rm_vim_swap {
  rm -rf ~/.tmp/*.swp
}

# Aliases
alias c='pbcopy'
alias p='pbpaste'
alias bex='bundle exec'
alias z='zeus'
alias v='vim'
alias g='git'
alias gam="python ~/work/gam/src/gam.py"

# Function that returns a count of background jobs for bash prompt.
function stoppedjobs {
  jobs -s | wc -l | sed -e "s/ //g"
}

export PS1='$(rvm-prompt)$(__git_ps1 " (%s)")\n\w[`stoppedjobs`]\$ '

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
