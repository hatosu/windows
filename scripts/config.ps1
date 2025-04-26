$CONFIGS = "$env:USERPROFILE\files\os\windows\config"
$ROAMING = "$env:USERPROFILE\AppData\Roaming"
function conf { Copy-Item -Path "$CONFIGS\$NAME" -Destination "$ROAMING" -Recurse -Force }
function misc { Copy-Item -Path "$CONFIGS\$NAME" -Destination "$GO" -Recurse -Force }

# APPDATA
$NAME = "alacritty"; conf
$NAME = "FlowLauncher"; conf
$NAME = "Vencord"; conf

# OTHER
$NAME = "glazewm"; $GO = "$env:USERPROFILE\.glzr\"; misc
