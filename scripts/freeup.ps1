If (!([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]'Administrator')) {
  Write-Host " Launching in Admin mode" -f DarkRed
  $pwshexe = (Get-Command 'powershell.exe').Source
  Start-Process $pwshexe -ArgumentList ("-NoProfile -ExecutionPolicy Bypass -File `"{0}`"" -f $PSCommandPath) -Verb RunAs
  Exit
}
wsl --shutdown
Get-Process | Where-Object {$_.ProcessName -like '*ollama*'} | Stop-Process
Get-Process | Where-Object {$_.ProcessName -like '*Docker*'} | Stop-Process
mkdir "$env:USERPROFILE\TEMP"
Move-Item -Force `
  -Path "C:\Program Files (x86)\Steam\bin\cef\cef.win7\steamwebhelper.exe" `
  -Destination "$env:USERPROFILE\TEMP\deletethis.txt"
Move-Item -Force `
  -Path "C:\Program Files (x86)\Steam\bin\cef\cef.win7x64\steamwebhelper.exe" `
  -Destination "$env:USERPROFILE\TEMP\deletethis.txt"
taskkill /F /IM steamwebhelper.exe
For ($i = 0; $i -lt 100; $i++) {
  Get-Process | Where-Object {$_.ProcessName -like '*VmmemWSL*'} | Stop-Process
}
