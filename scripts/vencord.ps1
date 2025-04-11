function __ { Write-Host "" }
Stop-Process -Name "discord"
__
__
__
__
function _deps {
  if(!(Test-Path -Path "C:\Program Files\nodejs" )){
    __
    Write-Host "you do not have the required tools to use this script, install them now?" -ForegroundColor Cyan
    __
    $reply_ = read-host "yes or no?"
    __
    if ($reply_ -eq 'yes') {
      winget install --id=Git.Git -e
      winget install --id=OpenJS.NodeJS -e
      __
      Write-Host "!!! PLEASE RESTART POWERSHELL, AND RUN THIS SCRIPT AGAIN !!!" -ForegroundColor Red
      __
    } else {
      exit 0
    }
  }
}
function _install {
  Remove-Item "$env:USERPROFILE\AppData\Local\pnpm\*" -Recurse -Force
  npm install -g npm@latest
  npm config set fund false --location=global
  npm i -g pnpm
  pnpm setup
  pnpm add -g pnpm
  sleep 1
  cd "$env:USERPROFILE\"
  git clone https://github.com/Vendicated/Vencord
  sleep 1
  cd "$env:USERPROFILE\Vencord\"
  pnpm install
  sleep 1
  cd "$env:USERPROFILE\Vencord\src\"
  mkdir "$env:USERPROFILE\Vencord\src\userplugins"
  sleep 1
  cd "$env:USERPROFILE\Vencord\src\userplugins\"
  sleep 1

  # - add custom plugins here - #
  
  # git clone https://github.com/D3SOX/vc-betterActivities
  # cd ".\vc-betterActivities\"
  # sleep 1
  # git reset --hard 044b504666b8b753ab45d82c0cd0d316b1ea7e60
  # sleep 1
  # git clean -df
  
  # --------------------------- #
  
  sleep 1
  cd "$env:USERPROFILE\Vencord\"
  pnpm build
  pnpm inject
  cd "$env:USERPROFILE\"
}
if (Test-Path -Path "$env:USERPROFILE\Vencord\src") {
  __
  Write-Host "a previous vencord installation already exists, do you wish to reinstall?" -ForegroundColor Cyan
  __
  $answer = read-host "yes or no?"
  __
  if ($answer -eq 'yes') {
    $hash_ = Get-Random -Minimum 1 -Maximum 999999999999999999
    mv "$env:USERPROFILE\Vencord\" "$env:USERPROFILE\DELETE_THIS_OLD_VENCORD_FOLDER$hash_\"
    _deps
    _install
  } else {
    exit 0
  }
} else {
  _deps
  _install
}
