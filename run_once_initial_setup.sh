#!/bin/zsh

mkdir -p ~/tmp
mkdir -p ~/bin

source ${HOME}/.zshrc

curl --silent --location --output-dir ~/bin --remote-name "https://github.com/so-fancy/diff-so-fancy/releases/download/v1.4.4/diff-so-fancy" 
chmod 755 ~/bin/diff-so-fancy
