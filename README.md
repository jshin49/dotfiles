# dotfiles

Dotfile configurations for AWS Deep Learning AMI GPU Instances

## Install
```
echo ".dotfiles" >> .gitignore
git clone --bare https://github.com/jshin49/dotfiles.git
alias dot='/usr/bin/git --git-dir=$HOME/dotfiles.git/ --work-tree=$HOME'
rm .bash_profile .zshrc
dot checkout

bash .install.sh
```

If failed at Oh-my-zsh change shell, just run ```bash .install.sh``` agian
