# clone
cd "$env:USERPROFILE\"
git clone https://github.com/hatosu/windows
mv "$env:USERPROFILE\windows\" "$env:USERPROFILE\DELETE_THIS_FOLDER\"

# move dotfiles
mkdir "$env:USERPROFILE\.glzr\"
mv "$env:USERPROFILE\DELETE_THIS_FOLDER\dots\glazewm\" "$env:USERPROFILE\.glzr\"
mv "$env:USERPROFILE\DELETE_THIS_FOLDER\dots\zebar\" "$env:USERPROFILE\.glzr\"
mv "$env:USERPROFILE\DELETE_THIS_FOLDER\dots\alacritty\" "$env:USERPROFILE\AppData\Roaming\"
mv "$env:USERPROFILE\DELETE_THIS_FOLDER\dots\Hyper\" "$env:USERPROFILE\AppData\Roaming\"
mv "$env:USERPROFILE\DELETE_THIS_FOLDER\dots\FlowLauncher\" "$env:USERPROFILE\AppData\Roaming\"
mv "$env:USERPROFILE\DELETE_THIS_FOLDER\dots\Vencord\" "$env:USERPROFILE\AppData\Roaming\"
