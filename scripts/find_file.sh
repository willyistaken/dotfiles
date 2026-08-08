#!/usr/bin/zsh

mimeopen /home/willychan/$(find $HOME -type f |  sed 's|/home/willychan||' | tofi)

