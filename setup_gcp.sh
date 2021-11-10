# create github ssh key
ssh-keygen -t ed25519 -C "jshin49@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# set up vim
# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall

# neovim
sudo apt-get install neovim python3-neovim

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +qall
mkdir -p ~/.config/nvim
pip install pynvim

# neovim config = vim config
ln -sf ~/.vimrc ~/.config/nvim/init.vim

# tmux conf
wget -O .tmux.conf https://raw.githubusercontent.com/jshin49/dotfiles/master/.tmux/tmux.conf

# zsh & oh-my-zsh
sudo apt install zsh
sudo apt-get install powerline fonts-powerline
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
