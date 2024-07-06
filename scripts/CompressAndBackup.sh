#!/usr/bin/zsh
cd ~/dotfiles
tar czf BrowserProfile.tar.gz ~/.mozilla/firefox/firefoxs.willyprofile/ 
echo "Input Key:"
read keys
rm BrowserProfile.tar.gz.gpg
gpg --batch --output BrowserProfile.tar.gz.gpg --passphrase $keys --symmetric BrowserProfile.tar.gz
#decrypt: gpg --batch --output BrowserProfile.tar.gz --passphrase $keys --decrypt BrowserProfile.tar.gz.gpg
rm BrowserProfile.tar.gz
echo "done"


