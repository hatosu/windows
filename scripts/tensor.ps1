If (!([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]'Administrator')) {
  Write-Host " Launching in Admin mode" -f DarkRed
  $pwshexe = (Get-Command 'powershell.exe').Source
  Start-Process $pwshexe -ArgumentList ("-NoProfile -ExecutionPolicy Bypass -File `"{0}`"" -f $PSCommandPath) -Verb RunAs
  Exit
}
$NAME = Read-Host "name of model: "
$PATH = Read-Host "path of model: "
Remove-Item -Force -Path "$env:USERPROFILE\llama"
git clone https://github.com/ggml-org/llama.cpp `
  "$env:USERPROFILE\llama"
python -m pip install --upgrade pip
pip install PyYAML numpy torch sentencepiece
python.exe "$env:USERPROFILE\llama\convert_hf_to_gguf.py" `
  $PATH --outfile "$env:USERPROFILE\Downloads\$NAME.gguf" --outtype auto
