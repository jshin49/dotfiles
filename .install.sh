# Install make
sudo apt-get update
sudo apt-get install -y libevent-dev ncurses-dev build-essential bison pkg-config
sudo apt-get install -y curl libssl-dev libreadline-dev zlib1g-dev tmux


################# Vim #################
# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall

# neovim
# sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
# sudo yum install -y neovim python3-neovim
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim python3-neovim

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +qall
mkdir -p ~/.config/nvim
pip install pynvim

# neovim config = vim config
ln -sf ~/.vimrc ~/.config/nvim/init.vim

################# Ruby #################
# sudo yum install -y readline-devel
sudo apt-get install lib32readline7 lib32readline-dev 
# git clone https://github.com/rbenv/rbenv.git ~/.rbenv
# git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
# git clone https://github.com/rbenv/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash
source $HOME/.path.sh

# RUBY_VERSION='2.6.3'
# rbenv install $RUBY_VERSION
# rbenv global $RUBY_VERSION

################# Tmux #################
# cd ~/
# wget https://github.com/downloads/libevent/libevent/libevent-2.0.21-stable.tar.gz
# tar xzvf libevent-2.0.21-stable.tar.gz
# cd libevent-2.0.21-stable
# ./configure && make
# sudo make install

# cd ~/
# wget https://github.com/tmux/tmux/releases/download/2.8/tmux-2.8.tar.gz
# tar xzf tmux-2.8.tar.gz
# cd tmux-2.8
# ./configure && make
# sudo make install

# tmuxinator
# gem install --user-install tmuxinator

# tpm
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cd ~/
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

################# Zsh #################

# Install ZSH & Oh my zsh
sudo apt-get update & sudo apt upgrade
sudo apt install zsh
sudo apt-get install powerline fonts-powerline
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sudo chsh -s $(which zsh)
