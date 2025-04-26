winget upgrade --all --include-unknown
choco upgrade all -y
Install-Module PSWindowsUpdate
Get-WindowsUpdate
Write-Host "please wait..."
Start-Sleep 5
Install-WindowsUpdate
Write-Host "finished!"
Start-Sleep 2
