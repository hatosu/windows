If (!([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]'Administrator')) {
  Write-Host " Launching in Admin mode" -f DarkRed
  $pwshexe = (Get-Command 'powershell.exe').Source
  Start-Process $pwshexe -ArgumentList ("-NoProfile -ExecutionPolicy Bypass -File `"{0}`"" -f $PSCommandPath) -Verb RunAs
  Exit
}

winget upgrade --all --include-unknown
choco upgrade all -y
copy-item -Force `
  -Path "C:\ProgramData\chocolatey\bin\youtube-dl.exe" `
  -Destination "C:\ProgramData\chocolatey\lib\mpvio.install\tools"
Install-Module PSWindowsUpdate
Get-WindowsUpdate
Write-Host "please wait..."
Start-Sleep 5
Install-WindowsUpdate
Write-Host "finished!"
Start-Sleep 2
