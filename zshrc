autoload -U colors && colors
autoload -U promptinit && promptinit
setopt promptsubst

# key mappings
# - delete word
# - delete line
#   ==> see https://coderwall.com/p/ds2dha/word-line-deletion-and-navigation-shortcuts-in-iterm2

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.history

git_prompt_info() {
  current_branch=$(git current-branch 2> /dev/null)
  if [[ -n $current_branch ]]; then
    echo " %{$fg_bold[green]%}$current_branch%{$reset_color%}"
  fi
}

source $(brew --prefix)/share/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle brew
antigen bundle bundler
antigen bundle command-not-found
antigen bundle docker
antigen bundle git
antigen bundle gem
antigen bundle osx
antigen bundle kiurchv/asdf.plugin.zsh
antigen bundle Tarrasch/zsh-autoenv

antigen bundle zsh-users/zsh-syntax-highlighting

POWERLEVEL9K_COLOR_SCHEME="light"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(vcs newline dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs load command_execution_time)

antigen theme bhilburn/powerlevel9k

antigen apply

alias ec="emacsclient -c"
alias et="emacsclient -t"
alias fuck='eval $(thefuck $(fc -ln -1 | tail -n 1)); fc -R'

export ERL_AFLAGS="-kernel shell_history enabled"
# export RUBYOPT="-W0"
export EDITOR="emacsclient -t"

export PATH="/usr/local/opt/qt@5.5/bin:$PATH"

# if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi
# eval "$(rbenv init - zsh)"
# eval "$(exenv init - zsh)"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH="$HOME/.yarn/bin:$PATH:$HOME/bin"

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash
