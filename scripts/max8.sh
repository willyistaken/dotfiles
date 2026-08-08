
#!/bin/bash

export GDK_BACKEND=x11
export WINE_FULLSCREEN_FUDGE=0

# Set prefix and Proton path
PREFIX="$HOME/.steam/steam/steamapps/compatdata/1493710/pfx"
PROTON="/home/willychan/.steam/steam/steamapps/common/Proton - Experimental/proton"

# Step 1: Initialize the prefix (if not done already)
"$PROTON" run wineboot



export WINEDEBUG=+x11drv
STEAM_COMPAT_DATA_PATH="$PREFIX" \
STEAM_COMPAT_CLIENT_INSTALL_PATH="$HOME/.steam/steam/" \
"$PROTON" run "C:\\Program Files\\Cycling '74\\Max 8\\Max.exe"

