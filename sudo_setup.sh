yes | apt-get install qt5-default libqt5webkit5-dev
yes | apt-get install xvfb
yes | apt-get install zsh

# Install tmate
apt-get install software-properties-common && \
add-apt-repository ppa:nviennot/tmate      && \
apt-get update                             && \
apt-get install tmate
