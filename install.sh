yum -y install zsh
yum -y install tmux
yum -y install git
ln -s ./config/vim/ ~/.vim
ln -s ./config/zsh/.zshrc ~/.zshrc
ln -s ./config/vim/.vimrc ~/.vimrc
ln -s ./config/tmux/.tmux.conf ~/.tmux.conf
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sht
rm -rf ~/.zshrc
ln -s ./config/zsh/.zshrc ~/.zshrc
