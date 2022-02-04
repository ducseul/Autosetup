PowerShell -Command "Set-ExecutionPolicy RemoteSigned -scope Process; iwr -useb https://raw.githubusercontent.com/gerardog/gsudo/master/installgsudo.ps1 | iex"
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))"
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "$env:Path += C:\ProgramData\chocolatey\bin"
call choco --version
echo Enable Hyper-V
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
call dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
echo PLEASE INSTALL UBUNTU DISTRO FOR FURTHER
start ms-windows-store:
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -NoRestart"
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All"
wsl --set-default-version 2
call chocolatey feature enable -n allowGlobalConfirmation
call choco install --with-shortcuts packages.config - y
call pip install -R requirements.txt
shutdown /r