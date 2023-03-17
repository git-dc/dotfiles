#! /bin/bash
# Replace fuzzy clock extention.js with custom file

echo "Change directory to ~/.local/share/gnome-shell/extensions/FuzzyClock@johngoetz"
cd ~/.local/share/gnome-shell/extensions/FuzzyClock@johngoetz/

echo "Moving extension.js to extension.js.bak"
mv extension.js extension.js.bak

echo "Linking extension.js to .dotfiles/extensions/fuzzy-clock.extension.js"
ln -s ~/.dotfiles/extensions/fuzzy-clock.extension.js extension.js
