source $HOME/.config/antigen/antigen.zsh
POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k
export PATH=$PATH:~/bin
export TERM="xterm-256color"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'


# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle docker
antigen bundle z
antigen bundle common-aliases
antigen bundle command-not-found
antigen bundle sudo

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# STUFF
antigen bundle zsh-users/zsh-history-substring-search 
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle jimeh/zsh-peco-history
antigen bundle djui/alias-tips
antigen bundle zsh-users/zsh-completions

# Load the theme.
antigen theme bhilburn/powerlevel9k powerlevel9k

# Tell Antigen that you're done.
antigen apply
