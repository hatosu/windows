# clone
cd "$env:USERPROFILE\"
git clone https://github.com/hatosu/windows
mv "$env:USERPROFILE\windows\" "$env:USERPROFILE\DELETE_THIS_FOLDER\"

# move dotfiles
mkdir "$env:USERPROFILE\.glzr\"
mv "$env:USERPROFILE\DELETE_THIS_FOLDER\config\glazewm\" "$env:USERPROFILE\.glzr\"
mv "$env:USERPROFILE\DELETE_THIS_FOLDER\config\Startup\*" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\"
mv "$env:USERPROFILE\DELETE_THIS_FOLDER\config\alacritty\" "$env:USERPROFILE\AppData\Roaming\"
mv "$env:USERPROFILE\DELETE_THIS_FOLDER\config\FlowLauncher\" "$env:USERPROFILE\AppData\Roaming\"
mv "$env:USERPROFILE\DELETE_THIS_FOLDER\config\vesktop\" "$env:USERPROFILE\AppData\Roaming\"
