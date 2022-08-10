Just in case I need to use them somewhere

**How to initialize:**
first, create a `/.dotfiles` directory, then initialize the barebone repo
```bash
git init --bare $HOME/.dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.bashrc
```

**How to use:**
```bash
git clone --bare git@github.com:richardwzp/dotfiles.git $HOME/.dotfiles
```
the `dot` command inside of zshrc is used to create a macro for managing this barebone repo. source the `.zshrc` file before trying to do more git operations.
