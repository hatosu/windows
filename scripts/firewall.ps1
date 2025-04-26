$PROG = Read-Host "path to exe"
$NAME = Read-Host "name of app"
New-NetFirewallRule -DisplayName "$NAME" -Program "$PROG" -LocalPort Any -Direction Outbound -Action Block
New-NetFirewallRule -DisplayName "$NAME" -Program "$PROG" -LocalPort Any -Direction Inbound -Action Block
