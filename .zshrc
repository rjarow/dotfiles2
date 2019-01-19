# Sources and Variables
source $HOME/.config/antigen/antigen.zsh
POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k
#POWERLEVEL9K_MODE='nerdfont-complete'
export PATH=$PATH:~/bin
#export TERM="xterm-256color"
compctl -g '~/.teamocil/*(:t:r)' teamocil

# Aliases
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

ssh() {
    if [ "$(ps -p $(ps -p $$ -o ppid=) -o comm=)" = "tmux" ]; then
        tmux rename-window "$(echo $* | cut -d . -f 1)"
        command ssh "$@"
        tmux set-window-option automatic-rename "on" 1>/dev/null
    else
        command ssh "$@"
    fi
}


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
# antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zdharma/fast-syntax-highlighting

# STUFF
antigen bundle zsh-users/zsh-history-substring-search 
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle jimeh/zsh-peco-history
antigen bundle djui/alias-tips
antigen bundle zsh-users/zsh-completions
antigen bundle chrissicool/zsh-256color

antigen bundle joel-porquet/zsh-dircolors-solarized.git
# Load the theme.

# Powerline based themes
# antigen theme bhilburn/powerlevel9k powerlevel9k
# antigen theme https://github.com/denysdovhan/spaceship-prompt spaceship
# antigen theme https://github.com/wadehammes/wade.zsh-theme wade.zsh-theme
#
#
# Simple themes  for when no nerdfont powerline
# antigen bundle davydovanton/excess.zsh-theme
# antigen theme davydovanton/excess.zsh-theme
#
# antigen bundle yardnsm/blox-zsh-theme
#antigen bundle jimeh/plain.zsh-theme
#antigen theme jimeh/plain.zsh-theme
#
# antigen theme gianu
# antigen theme noplay/lagune lagune
antigen theme https://github.com/win0err/aphrodite-terminal-theme
# antigen bundle yous/lime
# antigen bundle martinrotter/powerless


# Tell Antigen that you're done.
antigen apply
