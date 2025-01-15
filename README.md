<h1 align=center>
  <img src="https://github.com/hatosu/windows/blob/main/showcase.gif?raw=true" />
</h1>

how to install:
  ```powershell
  # run these two commands with admin
  Set-ExecutionPolicy RemoteSigned
  iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/hatosu/windows/master/install.ps1'))

  # then restart terminal, and run these commands without admin
  iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/hatosu/windows/master/file.ps1'))
  iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/hatosu/windows/master/package.ps1'))

  # lastly, follow the steps in manual.txt because im garbage at powershell
  ```
