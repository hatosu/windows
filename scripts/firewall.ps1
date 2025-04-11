If (!([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]'Administrator')) {
  Write-Host " Launching in Admin mode" -f DarkRed
  $pwshexe = (Get-Command 'powershell.exe').Source
  Start-Process $pwshexe -ArgumentList ("-NoProfile -ExecutionPolicy Bypass -File `"{0}`"" -f $PSCommandPath) -Verb RunAs
  Exit
}
$PROG = Read-Host "path to exe"
$NAME = Read-Host "name of app"
New-NetFirewallRule -DisplayName "$NAME" -Program "$PROG" -LocalPort Any -Direction Outbound -Action Block
New-NetFirewallRule -DisplayName "$NAME" -Program "$PROG" -LocalPort Any -Direction Inbound -Action Block
