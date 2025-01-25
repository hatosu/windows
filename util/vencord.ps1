function __ {
  Write-Host ""
}

function _install {
  winget install --id=OpenJS.NodeJS -e
  . $profile
  npm i -g pnpm
  cd "$env:USERPROFILE\"
  git clone https://github.com/Vendicated/Vencord
  cd "$env:USERPROFILE\Vencord\"
  pnpm install
  cd "$env:USERPROFILE\Vencord\src\"
  mkdir userplugins
  cd "$env:USERPROFILE\Vencord\src\userplugins\"

  # add git clones of custom plugins here
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
    mv "$env:USERPROFILE\Vencord\" "$env:USERPROFILE\DELETE_THIS_OLD_VENCORD_FOLDER\"
    _install
  } else {
    exit 0
  }
} else {
  _install
}
