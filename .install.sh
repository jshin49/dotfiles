################# Zsh #################

# Install ZSH & Oh my zsh
sudo yum update && sudo yum -y install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sudo chsh -s $(which zsh)

################# Vim #################
# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall

# neovim
sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum install -y neovim python3-neovim

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +qall
mkdir -p ~/.config/nvim
pip install pynvim

# neovim config = vim config
ln -sf ~/.vimrc ~/.config/nvim/init.vim

################# Ruby #################
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone https://github.com/rbenv/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash
source $HOME/.path.sh

RUBY_VERSION='2.6.3'
rbenv install $RUBY_VERSION
rbenv global $RUBY_VERSION

################# Tmux #################
sudo apt-get install tmux

# tmuxinator
gem install --user-install tmuxinator

# tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
