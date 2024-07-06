#!/usr/bin/zsh
cd 	~/dotfiles
git add .
time=$(date +'%Y/%m/%d:%H:%M')
git commit -m "$time Update Config"
git push
