Stop-Process -Name "discord"

function __ { Write-Host "" }

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
      exit 0
    } else {
      exit 0
    }
  }
}

function _install {
  npm i -g pnpm
  pnpm setup
  pnpm add -g pnpm
  cd "$env:USERPROFILE\"
  git clone https://github.com/Vendicated/Vencord
  cd "$env:USERPROFILE\Vencord\"
  pnpm install
  cd "$env:USERPROFILE\Vencord\src\"
  mkdir userplugins
  cd "$env:USERPROFILE\Vencord\src\userplugins\"
  git clone https://github.com/D3SOX/vc-betterActivities
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
