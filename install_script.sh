#/bin/bash

#build .local dir
mkdir ~/.local
mkdir ~/.local/bin
mkdir ~/.local/lib
mkdir ~/.local/share

#build .config dir
mkdir ~/.config

#install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp $PWD/.zshenv ~
cp $PWD/agnoster-circle.zsh-theme ~/.oh-my-zsh/themes

#install auto-suggestion
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

#install neo-vim
wget https://github.com/neovim/neovim/releases/download/v0.7.0/nvim-linux64.tar.gz
tar zxvf nvim-linux64.tar.gz
cp nvim-linux64/bin/* ~/.local/bin
cp nvim-linux64/lib/* ~/.local/lib
cp -r nvim-linux64/share/* ~/.local/share

#move neovim config
mkdir ~/.config/nvim
cp $PWD/nvim/init.vim ~/.config/nvim
cp -r $PWD/nvim/syntax ~/.config/nvim

#install nvim plugin
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

#install direnv
wget https://github.com/direnv/direnv/releases/download/v2.31.0/direnv.linux-amd64
mv direnv.linux-amd64 direnv
chmod +x direnv
cp direnv ~/.local/bin

#install node js npm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

#handle some config
git config --global core.editor "nvim"
git config --global user.name "circYuan"
git config --global user.email "quanyueyuan@gmail.com"

rm *.tar.gz
rm -r nvim-linux64
rm direnv
