cwd=$(pwd)
brew install autoconf automake
curl -O https://distfiles.macports.org/MacPorts/MacPorts-2.7.2.tar.bz2
tar xf MacPorts-2.7.2.tar.bz2 -C ~
cd ~/MacPorts-2.7.2/
./configure
make
sudo make install
echo 'export PATH="/opt/local/bin:/opt/local/sbin:$PATH"' >> ~/.zshrc
cd ${cwd}