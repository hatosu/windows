function fetchFromGitHub {
  $___ = & "C:\Program Files\Git\bin\bash.exe" -c `
    "curl -s https://api.github.com/repos/$USER/$REPO/releases/latest | jq --raw-output '.assets[$ITEM] | .browser_download_url'"
  Invoke-WebRequest $___ -OutFile "$env:USERPROFILE\$REPO.exe"
  Start-Process -FilePath "$env:USERPROFILE\$REPO.exe"
  Start-Sleep 3
  $HASH1 = Get-Random -Minimum 1 -Maximum 999999999999999999
  $HASH2 = Get-Random -Minimum 1 -Maximum 999999999999999999
  $HASH3 = Get-Random -Minimum 1 -Maximum 999999999999999999
  mv "$env:USERPROFILE\$REPO.exe" "$env:USERPROFILE\DELETE_THIS_USELESS_FILE_$HASH1_$HASH2_$HASH3.exe"
}

$USER = "hluk"
$REPO = "CopyQ"
$ITEM = "1"
fetchFromGitHub

$USER = "AnimeEffectsDevs"
$REPO = "AnimeEffects"
$ITEM = "0"
fetchFromGitHub

$USER = "Toinane"
$REPO = "colorpicker"
$ITEM = "4"
fetchFromGitHub

$winpkgs =
"Ollama.Ollama",
"Docker.DockerDesktop",
"ShareX.ShareX",
"Audacity.Audacity",
"AutoHotkey.AutoHotkey",
"KDE.Krita",
"Zoom.Zoom",
"Microsoft.PowerShell",
"glzr-io.glazewm",
"Alacritty.Alacritty",
"BlenderFoundation.Blender",
"TheDocumentFoundation.LibreOffice",
"Flameshot.Flameshot",
"Klocman.BulkCrapUninstaller",
"OBSProject.OBSStudio",
"Valve.Steam",
"Anki.Anki",
"Flow-Launcher.Flow-Launcher",
"FreeCAD.FreeCAD",
"GodotEngine.GodotEngine",
"Rufus.Rufus",
"CharlesMilette.TranslucentTB",
"LMMS.LMMS",
"PrismLauncher.PrismLauncher",
"RARLab.WinRAR",
"eloston.ungoogled-chromium",
"Vencord.Vesktop",
"Ventoy.Ventoy"
foreach ($i in $winpkgs) { winget install -e --id=$i }

# remove unwanted packages
winget uninstall --id=glzr-io.zebar
