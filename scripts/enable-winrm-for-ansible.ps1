[Net.ServicePointManager]::SecurityProtocol = 'Tls12'
iex ((New-Object System.Net.Webclient).DownloadString('https://github.com/ansible/ansible/raw/devel/examples/scripts/ConfigureRemotingForAnsible.ps1'))