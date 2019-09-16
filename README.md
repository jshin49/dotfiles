# dotfiles

Dotfile configurations for AWS AMI GPU Instances

## Install
```
echo ".dotfiles" >> .gitignore
git clone --bare https://github.com/j-min/dotfiles $HOME/.dotfiles
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dot checkout

bash .install.sh
```
