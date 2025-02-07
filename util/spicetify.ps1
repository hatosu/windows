Stop-Process -Name "spotify"
$v_ = winget show --id=Spotify.Spotify --versions | select -First 15 | select -Last 1
winget install --id=Spotify.Spotify --version $v_ --no-upgrade --exact --force
Start-Process "$env:USERPROFILE\AppData\Roaming\Spotify\Spotify.exe"
Write-Host ""
Write-Host "SPOTIFY WILL OPEN TEMPORARILY, PLEASE DO NOTHING & WAIT 30 SECONDS. . ." -ForegroundColor Cyan
1..30 | % {
  Write-Host ' .' -NoNewline
  sleep 1
}
Write-Host ""
Stop-Process -Name "spotify"
iwr -useb https://raw.githubusercontent.com/spicetify/cli/main/install.ps1 | iex
