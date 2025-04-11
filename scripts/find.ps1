cd C:\
$x = fzf
$y = Split-Path -Parent -Path "C:\$x"
start $y
