#!/bin/bash

# Updates
sudo apt -y update

#install some useful system tools
sudo apt -y install socat p7zip unzip

# Installing languages
echo 'languages'
sudo apt -y install python3 python3-pip ipython3 ipython
sudo apt -y install golang
sudo apt -y install gdb gdb-multiarch
sudo apt -y install gcc-multilib
sudo apt -y install clang llvm lldb build-essential
sudo apt -y install binutils binwalk

# zsh
sudo apt -y install zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="af-magic"/g' ~/.zshrc


# Install tools
cd ~
mkdir tools
cd tools


# Install GEF
echo 'gef'
wget -O ~/tools/gdbinit-gef.py -q https://github.com/hugsy/gef/raw/master/gef.py
echo source ~/tools/gdbinit-gef.py >> ~/.gdbinit


# Install radare2
echo 'r2'
cd ~/tools
git clone https://github.com/radare/radare2
cd radare2
./sys/install.sh

# Install afl
cd ~/tools
wget http://lcamtuf.coredump.cx/afl/releases/afl-latest.tgz
tar -zxvf afl-latest.tgz
rm afl-latest.tgz
mv afl-* afl
cd afl
sudo make install


# Hexyl
# cd ~/tools
# git clone https://github.com/sharkdp/hexyl
# cd hexyl
# cargo install hexyl


# Awesome py packages
echo 'pip3'
sudo -H pip3 install r2pipe
sudo -H pip3 install frida
sudo -H pip3 install angr 


echo 'done'
sudo chsh -s $(which zsh) vagrant
