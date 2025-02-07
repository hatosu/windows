# go to userdir
cd "$env:USERPROFILE\"

# winget
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Host "winget not installed, attempting to install"
    $installerUrl = "https://aka.ms/getwinget"
    $installerPath = "$env:TEMP\AppInstaller.msixbundle"
    try {
        Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath
        Write-Host "winget has been downloaded"
        Add-AppxPackage -Path $installerPath
        Write-Host "installation complete"
    } catch {
        Write-Host "failed to install winget, maybe try again?"
        Write-Host $_.Exception.Message
    }
} else {
    Write-Host "winget is already installed"
}
Add-AppxPackage -Path "https://aka.ms/getwinget"

# sudo
PowerShell -Command "Set-ExecutionPolicy RemoteSigned -scope Process; [Net.ServicePointManager]::SecurityProtocol = 'Tls12'; iwr -useb https://raw.githubusercontent.com/gerardog/gsudo/master/installgsudo.ps1 | iex"
Write-Output "`nImport-Module 'gsudoModule'" | Add-Content $PROFILE

# wsl
wsl --install --no-distribution

# git
winget install --id=Git.Git -e
