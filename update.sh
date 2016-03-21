#!/bin/sh

# A simple script that updates the dot files

git pull origin master
current_dir=`pwd`
cd ~
ln -sf $current_dir/.* ~
rm .git
cd $current_dir

