If (!([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]'Administrator')) {
  Write-Host " Launching in Admin mode" -f DarkRed
  $pwshexe = (Get-Command 'powershell.exe').Source
  Start-Process $pwshexe -ArgumentList ("-NoProfile -ExecutionPolicy Bypass -File `"{0}`"" -f $PSCommandPath) -Verb RunAs
  Exit
}
Write-Host ""
Write-Host "!!! ONLY OPEN WEBSITE ONCE THIS WINDOW CLOSES !!!" -f Red
Write-Host ""
Write-Host "glorp that shit up"
Get-Process | Where-Object {$_.ProcessName -like '*ollama*'} | Stop-Process
Start-Sleep 1
Get-Process | Where-Object {$_.ProcessName -like '*Docker*'} | Stop-Process
Start-Sleep 3
Start-Process -FilePath "C:\Program Files\Docker\Docker\Docker Desktop.exe"
Start-Sleep 15
docker start open-webui
Start-Sleep 1
ollama run gemma3:12b "say hi and nothing else"
Start-Sleep 3
