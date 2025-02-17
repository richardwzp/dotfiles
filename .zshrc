# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# this is added in anticipation for m2 mac, so homebrew install can be found
export PATH="/opt/homebrew/bin:${PATH}"
export PATH="$HOME/.cargo/bin:$PATH"

alias sandman_azure="ssh -i ~/.ssh/richardkey.pem wzprichardwzp@20.124.13.35"


# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
# add theme sepecifif config


#ZSH_THEME="afowler"


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git 
	 git-extras
   z
	 common-aliases
	 pyenv
	 macos
	 kubectl
	 colored-man-pages)

source $ZSH/oh-my-zsh.sh

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=4'
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"


# an option from lsd, installed with cargo. This replace ls
alias ls="lsd --icon always"
alias l="lsd -al"
# defined as a function
# alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='lvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias neulogin="ssh wzprichardwzp@login.ccs.neu.edu"
alias warheadlogin="ssh warhead"
# export PATH="/usr/local/opt/python@3.9/bin:$PATH"
# make sure python can be found 
export PATH="/usr/local/opt/python@3.10/bin:$PATH"
# oh-my-zsh agnoster theme, change user

# spotify plugin
alias splay="spotify play"
alias spause="spotify pause"

# alacritty window
alias alacritty="/Applications/Alacritty.app/Contents/MacOS/alacritty"
alias awind="alacritty msg create-window"

# tmux stuff
alias tt="tmux"
alias tm="tmuxinator"

# compiler stuff

# opam configuration
[[ ! -r $HOME/.opam/opam-init/init.zsh ]] || source $HOME/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# configure java 
# export JAVA_HOME=$HOME/Library/Java/JavaVirtualMachines/adopt-openjdk-14.0.2/Contents/Home

export PATH=$PATH:$HOME/.local/bin
export PATH="/usr/local/opt/llvm/bin:$PATH"

# llvm compiler flag
# export LDFLAGS="-L/usr/local/opt/llvm/lib"
# export CPPFLAGS="-I/usr/local/opt/llvm/include"
# this is for postgres database driver
export LDFLAGS="-L/opt/homebrew/opt/openssl@1.1/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@1.1/include"



# nvim setting
export NVIM_FOLDER="$HOME/.config/nvim/"

# dotfile convinient function
dot () {
  git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" "$@"
}


# to avoi dconflict with zsh alias
alias fnd='\fd'

# doom-emacs related stuff
PATH="~/.emacs.d/bin:$PATH"
export JAVA_HOME=$(/usr/libexec/java_home)

# export PATH="/opt/homebrew/anaconda3/bin:$PATH"  # commented out by conda initialize

# kitty stuff
# PATH="~/kitty/kitty/launcher:$PATH"
# export EDITOR="lvim"
# export VISUAL="lvim"
# export KITTY_CONFIG_DIRECTORY="~/.config/kitty"
alias kitty-config="lvim ~/.config/kitty/kitty.conf"

# tilting manager stuff: yabai and skhd
alias tilt-start="yabai --start-service && skhd --start-service"
alias tilt-stop="yabai --stop-service && skhd --stop-service"
alias tilt-restart="yabai --restart-service && skhd --restart-service"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# nvm stuff
  export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

source ~/terminal_cosmetic/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# arch specific
alias pacr="sudo pacman -Rnsu"
