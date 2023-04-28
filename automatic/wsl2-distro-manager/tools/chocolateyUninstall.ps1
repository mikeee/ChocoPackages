$ErrorActionPreference = 'Stop'

[Environment]::GetFolderPath('Programs'), [Environment]::GetFolderPath('CommonPrograms') | ForEach-Object {
    Remove-Item -Path (Join-Path -Path $_ -ChildPath 'wsl2 distro manager.lnk') -ErrorAction SilentlyContinue
}