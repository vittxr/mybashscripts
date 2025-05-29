# setup extensions folder
mkdir -p ~/Desktop/extensions/popshell

sudo apt install git node-typescript make
git clone https://github.com/pop-os/shell
cd shell
make local-install

# keyboard shortcuts
cd ~/Desktop/extensions/popshell
sudo apt install cargo rustc libgtk-3-dev
git clone https://github.com/pop-os/shell-shortcuts
cd shell-shortcuts 
make install

# open pop shell shortcuts window
pop-shell-shortcuts
