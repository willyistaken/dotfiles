#!/usr/bin/zsh
cd ~/dotfiles
cp -r ~/.mozilla/firefox/firefoxs.willyprofile .
tar czf BrowserProfile.tar.gz ~/.mozilla/firefox/firefoxs.willyprofile 


git add .
git commit -m "update config"
git push
