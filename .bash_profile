# .bash_profile

#Source .dlamirc in .bashrc
source ~/.dlamirc

# User specific aliases and functions
# . $HOME/anaconda3/etc/profile.d/conda.sh

# User specific environment and startup programs
PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH

# zsh as default shell
export SHELL=`which zsh`
[ -z "$ZSH_VERSION" ] && exec "$SHELL" -l

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi
