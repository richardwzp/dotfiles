Just in case I need to use them somewhere

**How to use:**
```bash
git clone --bare git@github.com:richardwzp/dotfiles.git $HOME/.dotfiles
./dot_install.sh
```
the `dot` command inside of zshrc is used to create a macro for managing this barebone repo. source the `.zshrc` file before trying to do more git operations.
BEWARE: the .zshrc file will be overwritten, it has to be `git add`ed back, and run `checkout` on it to restore it.

**How to initialize your own dotfile repositories:**
first, create a `/.dotfiles` directory, then initialize the barebone repo
(note: if you are using my .zshrc, there is no need to alias dot, as it is already defined as a function. In fact, that is preferred)
```bash
git init --bare $HOME/.dotfiles
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dot config --local status.showUntrackedFiles no
```

