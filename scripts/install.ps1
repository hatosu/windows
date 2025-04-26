# prevent the Invoke-WebRequest bug
$ProgressPreference = 'SilentlyContinue'

# winget
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
  Write-Host "winget not installed, attempting to install"
  $installerUrl = "https://aka.ms/getwinget"
  $installerPath = "$env:TEMP\AppInstaller.msixbundle"
  try {
    Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath
    Write-Host "winget has been downloaded"
    Add-AppxPackage -Path $installerPath
    Write-Host "installation complete"
  } catch {
    Write-Host "failed to install winget, maybe try again?"
    Write-Host $_.Exception.Message
  }
} else {
  Write-Host "winget is already installed"
}
Add-AppxPackage -Path "https://aka.ms/getwinget"
Set-Alias winget 'C:\Users\hatosu\AppData\Local\Microsoft\WindowsApps\winget.exe'

# choco
Set-ExecutionPolicy Bypass -Scope Process -Force; `
  [System.Net.ServicePointManager]::SecurityProtocol `
  = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex `
  ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
$ALTPRF = "$env:USERPROFILE\Documents\PowerShell"
mkdir "$ALTPRF"
New-Item "$ALTPRF\Microsoft.PowerShell_profile.ps1"
Copy-Item -Path "$env:USERPROFILE\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1" `
   -Destination "$ALTPRF" -Recurse -Force
Set-Alias choco 'C:\ProgramData\chocolatey\bin\choco.exe'

# linux
wsl --install --no-distribution

# sudo
winget install --id=gerardog.gsudo -e
Write-Output `
  "`nImport-Module 'gsudoModule'`nSet-Alias sudo 'C:\Program Files\gsudo\Current\gsudo.exe'" `
  | Add-Content "$env:USERPROFILE\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
Write-Output `
  "`nImport-Module 'gsudoModule'`nSet-Alias sudo 'C:\Program Files\gsudo\Current\gsudo.exe'" `
  | Add-Content "$env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"

# dependencies
$deps =
"jqlang.jq",
"Git.Git"
foreach ($i in $deps) { winget install -e --id=$i }

# clone
Set-Alias git 'C:\Program Files\Git\bin\git.exe'
cd "$env:USERPROFILE\"
git clone https://github.com/hatosu/windows
mv "$env:USERPROFILE\windows\" "$env:USERPROFILE\DELETE_THIS_FOLDER\"
cd "C:\WINDOWS\system32"

# dotfiles
$SRC = "$env:USERPROFILE\DELETE_THIS_FOLDER\config"
mkdir "$env:USERPROFILE\.glzr\"
mv "$SRC\glazewm\" "$env:USERPROFILE\.glzr\"
$dots =
"$SRC\alacritty",
"$SRC\FlowLauncher",
"$SRC\Vencord"
foreach ($i in $dots) { mv $i "$env:USERPROFILE\AppData\Roaming\" }

# gitfetch
$X = "$env:USERPROFILE"; $Y = $X.Substring(9)
function gf {
  $____ = & "C:\Program Files\Git\bin\bash.exe" -c "curl -s https://api.github.com/repos/$USER/$REPO/releases/latest | exec '/c/Users/$Y/AppData/Local/Microsoft/WinGet/Links/jq.exe' --raw-output '.assets[$ITEM] | .browser_download_url'"
  Invoke-WebRequest $____ -OutFile "$env:USERPROFILE\$REPO.exe"
  Start-Process -Wait -FilePath "$env:USERPROFILE\$REPO.exe"
  $HASH = Get-Random -Minimum 1 -Maximum 999999999999999999
  mv "$env:USERPROFILE\$REPO.exe" "$env:USERPROFILE\DELETE_THIS_USELESS_FILE_$HASH.exe"
}

# gitpkgs
$USER = "hluk"; $REPO = "CopyQ"; $ITEM = "1"; gf
$USER = "AnimeEffectsDevs"; $REPO = "AnimeEffects"; $ITEM = "0"; gf
$USER = "Toinane"; $REPO = "colorpicker"; $ITEM = "4"; gf

# winpkgs
$winpkgs =
"BlenderFoundation.Blender",
"FreeCAD.FreeCAD",
"goatcorp.XIVLauncher",
"Element.Element",
"GodotEngine.GodotEngine",
"GIMP.GIMP.Nightly",
"KDE.Krita",
"Ollama.Ollama",
"Zoom.Zoom",
"KDE.Kdenlive",
"OBSProject.OBSStudio",
"Valve.Steam",
"TheDocumentFoundation.LibreOffice",
"ShareX.ShareX",
"Audacity.Audacity",
"AutoHotkey.AutoHotkey",
"Microsoft.PowerShell",
"glzr-io.glazewm",
"WireGuard.WireGuard",
"Alacritty.Alacritty",
"LibreWolf.LibreWolf",
"SimnetLtd.SimpleStickyNotes",
"Flameshot.Flameshot",
"angryziber.AngryIPScanner",
"WiresharkFoundation.Wireshark",
"Parsec.Parsec",
"Klocman.BulkCrapUninstaller",
"Anki.Anki",
"Flow-Launcher.Flow-Launcher",
"Rufus.Rufus",
"CharlesMilette.TranslucentTB",
"LMMS.LMMS",
"qutebrowser.qutebrowser",
"PrismLauncher.PrismLauncher",
"junegunn.fzf",
"eloston.ungoogled-chromium",
"Discord.Discord",
"Ventoy.Ventoy"
foreach ($i in $winpkgs) { winget install -e --id=$i }

# chocopkgs
$chocopkgs =
"mpvio",
"winrar"
foreach ($i in $chocopkgs) { choco install $i }

# remove unwanted packages
winget uninstall --id=glzr-io.zebar

# enable mouse raw input
$RegConnect = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey([Microsoft.Win32.RegistryHive]"CurrentUser","$env:COMPUTERNAME")
$RegMouse = $RegConnect.OpenSubKey("Control Panel\Mouse",$true)
$acc_enabled = $RegMouse.GetValue("MouseSpeed")
if ( $acc_enabled -eq 1 ) {
  $RegMouse.SetValue("MouseSpeed","0")
  $RegMouse.SetValue("MouseThreshold1","0")
  $RegMouse.SetValue("MouseThreshold2","0")
  $sys_pvParam = @(0,0,0)
} else {
  $RegMouse.SetValue("MouseSpeed","1")
  $RegMouse.SetValue("MouseThreshold1","6")
  $RegMouse.SetValue("MouseThreshold2","10")
  $sys_pvParam = @(1,6,10)
}
$RegMouse.Close()
$RegConnect.Close()
$code = @'
[DllImport("user32.dll", EntryPoint = "SystemParametersInfo")]
 public static extern bool SystemParametersInfo(uint uiAction, uint uiParam, int[] pvParam, uint fWinIni);
'@
Add-Type $code -name Win32 -NameSpace System
[System.Win32]::SystemParametersInfo(4,0,$sys_pvParam,2)

# enable restore points
Enable-ComputerRestore -Drive "C:\"
Checkpoint-Computer -Description "ModifySettingsRelated" -RestorePointType MODIFY_SETTINGS

# install fonts
cd "$env:USERPROFILE"
Invoke-WebRequest `
  -Uri "https://files.catbox.moe/qcj59b.ttf" `
  -OutFile "$env:USERPROFILE\apercu.ttf"
$fonts = (New-Object -ComObject Shell.Application).Namespace(0x14)
foreach ($file in gci *.ttf) {
  $fileName = $file.Name
  if (-not(Test-Path -Path "C:\Windows\fonts\$fileName" )) {
    echo $fileName
    dir $file | %{ $fonts.CopyHere($_.fullname) }
  }
}
cp *.ttf c:\windows\fonts\
cd "C:\WINDOWS\system32"

# asus firmware
winget install --id=seerge.g-helper -e
$src = "https://dlcdnets.asus.com/pub/ASUS/GamingNB/Image/Driver"
$asuspkgs =
"$src/Networking/37571/WirelessLan_ROG_MediaTek_B_V3.3.2.971Sub1_37571.exe?model=ROG%20Zephyrus%20G14%20(2024)%20GA403",
"$src/Networking/38521/WirelessLan_ROG_MediaTek_B_V3.4.2.1046Sub1_38521.exe?model=ROG%20Zephyrus%20G14%20(2024)%20GA403",
"$src/Chipset/40187/AMD_Chipset_DriverOnly_ROG_AMD_B_V1.2.0.124Sub28_40187.exe?model=ROG%20Zephyrus%20G14%20(2024)%20GA403",
"$src/Audio/36931/Audio_DriverOnly_Dolby_ROG_Realtek_B_V6.0.9621.1_36931_1.exe?model=ROG%20Zephyrus%20G14%20(2024)%20GA403",
"$src/Audio/38619/Audio_DriverOnly_Dolby_ROG_Realtek_B_V6.0.9683.1_38619.exe?model=ROG%20Zephyrus%20G14%20(2024)%20GA403",
"$src/Audio/40186/SmartAMP_Cirrus_DCH_ROG_Cirrus_B_V25.26.50.500_40186.exe?model=ROG%20Zephyrus%20G14%20(2024)%20GA403",
"$src/Audio/37245/SmartAMP_Cirrus_DCH_ROG_Cirrus_B_V23.26.47.790_37245.exe?model=ROG%20Zephyrus%20G14%20(2024)%20GA403",
"$src/Graphics/38549/Graphic_DCH_ROG_SD_NVIDIA_B_V32.0.15.5597_38549.exe?model=ROG%20Zephyrus%20G14%20(2024)%20GA403",
"$src/Graphics/41273/Graphic_DCH_ROG_SD_NVIDIA_B_V32.0.15.6607_41273.exe?model=ROG%20Zephyrus%20G14%20(2024)%20GA403",
"$src/Graphics/36907/displayHDR_ROG_ASUS_B_V1.1.0.0_36907_1.exe?model=ROG%20Zephyrus%20G14%20(2024)%20GA403",
"$src/Graphics/37428/AMD_Graphic_DriverOnly_ROG_AMD_B_V31.0.22052.2_37428.exe?model=ROG%20Zephyrus%20G14%20(2024)%20GA403",
"$src/Graphics/40271/Graphic_DriverOnly_ROG_AMD_B_V31.0.22060.5000Sub1_40271.exe?model=ROG%20Zephyrus%20G14%20(2024)%20GA403",
"$src/CardReader/35723/CardReader_ROG_Realtek_B_V10.0.22621.21367_35723_1.exe?model=ROG%20Zephyrus%20G14%20(2024)%20GA403",
"$src/CardReader/38634/CardReader_ROG_Realtek_B_V10.0.26100.21373_38634.exe?model=ROG%20Zephyrus%20G14%20(2024)%20GA403",
"$src/PointingDevice/38162/PrecisionTouchPad_ROG_ASUS_B_V16.0.0.23Sub4_38162.exe?model=ROG%20Zephyrus%20G14%20(2024)%20GA403",
"$src/USB/35968/Parade_Retimer_ROG_Parade_B_V1.0.012.00_35968_1.exe?model=ROG%20Zephyrus%20G14%20(2024)%20GA403",
"$src/USB/38025/Parade_Retimer_ROG_Parade_B_V1.0.016.00_38025.exe?model=ROG%20Zephyrus%20G14%20(2024)%20GA403",
"$src/Bluetooth/37570/Bluetooth_ROG_MediaTek_B_V1.1037.2.410Sub1_37570.exe?model=ROG%20Zephyrus%20G14%20(2024)%20GA403",
"$src/Bluetooth/38516/Bluetooth_ROG_MediaTek_B_V1.1037.2.433Sub1_38516.exe?model=ROG%20Zephyrus%20G14%20(2024)%20GA403"
foreach ($i in $asuspkgs) {
  Remove-Item -Force -Path "$env:USERPROFILE\delete_this.exe"
  Invoke-WebRequest `
    -Uri "$i" `
    -OutFile "$env:USERPROFILE\delete_this.exe"
  Start-Process -Wait "$env:USERPROFILE\delete_this.exe"
}

# update windows (every fresh install wants this)
winget upgrade --all --include-unknown
choco upgrade all -y
Install-Module PSWindowsUpdate
Get-WindowsUpdate
Install-WindowsUpdate -IgnoreUserInput -IgnoreReboot -AcceptAll

# exec winutil
irm "https://christitus.com/win" | iex
