#!/bin/bash

# This script is used by crontab to update the website
# Copy this file to another directory and setup crontab to use it

. /etc/profile
. ~/.bash_profile
. ~/.bashrc

cd ~

export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

echo "* Cloning repo"
git clone /git/website.git

echo "* Building website"
cd website
bundle exec jekyll build
cd ~

echo "* Updating _site directory"
cp --recursive --update website/_site _site

echo "* Removing local repo"
rm --recursive website

