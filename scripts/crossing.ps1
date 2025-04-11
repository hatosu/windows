If (!([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]'Administrator')) { $pwshexe = (Get-Command 'powershell.exe').Source; Start-Process $pwshexe -ArgumentList ("-NoProfile -ExecutionPolicy Bypass -File `"{0}`"" -f $PSCommandPath) -Verb RunAs; Exit }

$USRDIR = "$env:USERPROFILE"

mkdir "$USRDIR\temp_"

$winpkgs =
"7zip.7zip",
"aria2.aria2"
foreach ($i in $winpkgs) { winget install -e --id=$i }

Invoke-WebRequest `
  -Uri "https://github.com/emuplace/sudachi.emuplace.app/releases/download/v1.0.15/sudachi-windows-v1.0.15.7z" `
  -OutFile "$USRDIR\sudachi.zip"
Invoke-WebRequest `
  -Uri "https://files.catbox.moe/kp1hke.zip" `
  -OutFile "$USRDIR\firm1.zip"
Invoke-WebRequest `
  -Uri "https://files.catbox.moe/szfs2d.zip" `
  -OutFile "$USRDIR\firm2.zip"
Invoke-WebRequest `
  -Uri "https://files.catbox.moe/oqjoff.zip" `
  -OutFile "$USRDIR\keys.zip"
Invoke-WebRequest `
  -Uri "https://files.catbox.moe/iyyr14.crp" `
  -OutFile "$USRDIR\DiscordStatus.crp"

$JUNK = "$USRDIR\Downloads\DELETE_THIS_PLEASE-FROMHATOSU"

function UnZip_ {
  & "C:\Program Files\7-Zip\7z.exe" x $USRDIR\$NAME.zip -o"$USRDIR\$NAME"
  Move-Item -Force `
    -Path "$USRDIR\$NAME.zip" `
    -Destination "$JUNK"
}

$NAME = "sudachi"
UnZip_
$NAME = "firm1"
UnZip_
$NAME = "firm2"
UnZip_
$NAME = "keys"
UnZip_

function TorGet {
  & "$USRDIR\AppData\Local\Microsoft\WinGet\Links\aria2c.exe" `
    --seed-time=0 "$TOR" -d "$USRDIR\temp_"
} # or --seed-ratio=1.0 to seed amount of file & be nice... guh...

$TOR = "magnet:?xt=urn:btih:01ec87c99730b150ff4ad94c0a87ca109c0d5f41&dn=Animal%20Crossing%20New%20Horizons%20%5bNSP%20%2b%203%20DLCs%20%2b%20Events%20%2b%20Update%202.0.6%5d&tr=udp%3a%2f%2ftracker.opentrackr.org%3a1337%2fannounce&tr=udp%3a%2f%2fopen.demonii.com%3a1337%2fannounce&tr=udp%3a%2f%2fopen.stealth.si%3a80%2fannounce&tr=udp%3a%2f%2ftracker.torrent.eu.org%3a451%2fannounce&tr=udp%3a%2f%2ftracker-udp.gbitt.info%3a80%2fannounce&tr=https%3a%2f%2ftracker.renfei.net%3a443%2fannounce&tr=https%3a%2f%2ftracker.gbitt.info%3a443%2fannounce&tr=http%3a%2f%2ftracker.renfei.net%3a8080%2fannounce&tr=http%3a%2f%2ftracker.gbitt.info%3a80%2fannounce&tr=udp%3a%2f%2ftracker.tryhackx.org%3a6969%2fannounce&tr=udp%3a%2f%2ftracker.tiny-vps.com%3a6969%2fannounce&tr=udp%3a%2f%2ftracker.0x7c0.com%3a6969%2fannounce&tr=udp%3a%2f%2fopentracker.io%3a6969%2fannounce&tr=udp%3a%2f%2foh.fuuuuuck.com%3a6969%2fannounce&tr=udp%3a%2f%2fmoonburrow.club%3a6969%2fannounce&tr=udp%3a%2f%2fexplodie.org%3a6969%2fannounce&tr=udp%3a%2f%2fexodus.desync.com%3a6969%2fannounce&tr=udp%3a%2f%2fbubu.mapfactor.com%3a6969%2fannounce&tr=https%3a%2f%2ftracker.tamersunion.org%3a443%2fannounce&tr=udp%3a%2f%2ftracker1.bt.moack.co.kr%3a80%2fannounce&tr=udp%3a%2f%2ftracker.openbittorrent.com%3a80%2fannounce"
TorGet

mkdir "$USRDIR\sudachi\firm"
mkdir "$USRDIR\sudachi\keys"

Start-Process -FilePath `
  "$USRDIR\sudachi\sudachi.exe" `
  -WindowStyle Minimized
Start-Sleep 10
taskkill /F /IM sudachi.exe

Move-Item -Force `
  -Path "$USRDIR\firm1\firm1\*" `
  -Destination "$USRDIR\sudachi\firm"
Move-Item -Force `
  -Path "$USRDIR\firm2\firm2\*" `
  -Destination "$USRDIR\sudachi\firm"
Move-Item -Force `
  -Path "$USRDIR\keys\keys\*" `
  -Destination "$USRDIR\AppData\Roaming\sudachi\keys"
Move-Item -Force `
  -Path "$USRDIR\temp_\*" `
  -Destination "$USRDIR\sudachi\"
Move-Item -Force `
  -Path "$USRDIR\DiscordStatus.crp" `
  -Destination "$USRDIR\sudachi\"
Move-Item -Force `
  -Path "$USRDIR\sudachi\Animal Crossing New Horizons ``[NSP + 3 DLCs + Events + Update 2.0.6``]" `
  -Destination "$USRDIR\sudachi\AnimalCrossingGame"
Move-Item -Force `
  -Path "$USRDIR\sudachi\AnimalCrossingGame\3 DLCs\*" `
  -Destination "$USRDIR\sudachi\AnimalCrossingGame\"

cmd /c rmdir /s /q "$USRDIR\temp_"
cmd /c rmdir /s /q "$USRDIR\firm1"
cmd /c rmdir /s /q "$USRDIR\firm2"
cmd /c rmdir /s /q "$USRDIR\keys"
cmd /c rmdir /s /q "$USRDIR\sudachi\AnimalCrossingGame\3 DLCs\"

$shell = New-Object -ComObject WScript.Shell
$shortcut = $shell.CreateShortcut("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\sudachi.lnk")
$shortcut.TargetPath = "$USRDIR\sudachi\sudachi.exe"
$shortcut.Save()

winget install -e --id=maximmax42.CustomRP
& $USRDIR\AppData\Roaming\CustomRP\CustomRP.exe $USRDIR\sudachi\DiscordStatus.crp
taskkill /F /IM CustomRP.exe

echo '
while($true) {
  if (!(Get-Process -ProcessName sudachi -ErrorAction SilentlyContinue)) {
    taskkill /F /IM CustomRP.exe
    Start-Sleep 5
  } else {
    if (!(Get-Process -ProcessName CustomRP -ErrorAction SilentlyContinue)) {
      Start-Process -FilePath $env:USERPROFILE\AppData\Roaming\CustomRP\CustomRP.exe -ArgumentList "$env:USERPROFILE\sudachi\DiscordStatus.crp" -WindowStyle Minimized -PassThru 
      Start-Sleep 5
    } else {
      Start-Sleep 5
    }
  }
}
' > "$USRDIR\sudachi\DiscordStatus.ps1"

echo '
Start-Process -FilePath `
$env:USERPROFILE\sudachi\DiscordStatus.ps1 `
  -WindowStyle Hidden -PassThru
' > "$USRDIR\sudachi\DiscordStatusDep.ps1"

$shell = New-Object -ComObject WScript.Shell
$shortcut = $shell.CreateShortcut("$USRDIR\sudachi\DiscordStatusDep.lnk")
$shortcut.TargetPath = "$USRDIR\sudachi\DiscordStatusDep.ps1"
$shortcut.Save()

Move-Item -Force `
  -Path "$USRDIR\sudachi\DiscordStatusDep.lnk" `
  -Destination "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\DiscordStatusDep.lnk"

cmd /c powershell.exe Start-Process `
  -FilePath $env:USERPROFILE\sudachi\DiscordStatusDep.ps1 `
  -WindowStyle Hidden -PassThru
Start-Sleep 2
taskkill /F /IM CustomRP.exe
Start-Process -FilePath $env:USERPROFILE\AppData\Roaming\CustomRP\CustomRP.exe -ArgumentList "$env:USERPROFILE\sudachi\DiscordStatus.crp" -WindowStyle Minimized -PassThru
