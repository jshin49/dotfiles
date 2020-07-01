# dotfiles

Dotfile configurations for Ubuntu, many parts inspired and taken from [J-Min's repo](https://github.com/j-min/dotfiles)

## Install
```
echo ".dotfiles" >> .gitignore
git clone --bare https://github.com/jshin49/dotfiles.git $HOME/.dotfiles
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
rm .bash_profile .zshrc
dot checkout

bash .install.sh
```

If failed at Oh-my-zsh change shell, just run ```bash .install.sh``` agian
