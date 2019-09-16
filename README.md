# dotfiles

Dotfile configurations for AWS Deep Learning AMI GPU Instances

## Install
```
echo ".dotfiles" >> .gitignore
git clone --bare https://github.com/jshin49/dotfiles.git
alias dot='/usr/bin/git --git-dir=$HOME/dotfiles.git/ --work-tree=$HOME'
dot checkout

bash .install.sh
```
