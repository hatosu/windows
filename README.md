<h1 align=center>
  <img src="https://github.com/hatosu/windows/blob/main/showcase.gif?raw=true" />
</h1>

(note, this repo only exists for me to use) how to install:
  ```powershell
  # as ADMIN, run all following commands in order
  Set-ExecutionPolicy RemoteSigned
  iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/hatosu/windows/master/scripts/install.ps1'))
  iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/hatosu/windows/master/scripts/file.ps1'))
  iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/hatosu/windows/master/scripts/package.ps1'))

  # lastly, follow the steps in manual.txt because im garbage at powershell
  Write-Host "( ╥﹏╥) ノシ"
  ```
