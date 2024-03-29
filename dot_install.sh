#!/bin/zsh

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo '# Set PATH, MANPATH, etc., for Homebrew.' >> $HOME/.zprofile

# need to run some custom homebrew things
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# zsh syntaxhighlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# power 10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# install font
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
# install neovim
brew install neovim
# install better git
brew install git
brew install python

# install vimplug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# install rust
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
sh <(curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs) -y
rustc --version

# install packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# install utilities
brew install ripgrep
brew install fd

brew install jesseduffield/lazygit/lazygit
brew install yarn
brew install exa
brew install yq
brew install jq
brew install node
brew install yarn
brew install tmux
brew install wget

# currently using tmux plugin
# git clone git@github.com:richardwzp/tmux-sensible.git

# need to install make
LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh) --yes

# add alacritty
npm i -g alacritty-themes





