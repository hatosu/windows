If (!([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]'Administrator')) {
  Write-Host " Launching in Admin mode" -f DarkRed
  $pwshexe = (Get-Command 'powershell.exe').Source
  Start-Process $pwshexe -ArgumentList ("-NoProfile -ExecutionPolicy Bypass -File `"{0}`"" -f $PSCommandPath) -Verb RunAs
  Exit
}

$CONFIGS = "$env:USERPROFILE\files\os\windows\config"
$ROAMING = "$env:USERPROFILE\AppData\Roaming"

Copy-Item -Path "$CONFIGS\glazewm" -Destination "$env:USERPROFILE\.glzr\" -Recurse -Force
Copy-Item -Path "$CONFIGS\alacritty" -Destination "$ROAMING\" -Recurse -Force
Copy-Item -Path "$CONFIGS\FlowLauncher" -Destination "$ROAMING\" -Recurse -Force
Copy-Item -Path "$CONFIGS\qutebrowser" -Destination "$ROAMING\" -Recurse -Force
Copy-Item -Path "$CONFIGS\Vencord" -Destination "$ROAMING\" -Recurse -Force
