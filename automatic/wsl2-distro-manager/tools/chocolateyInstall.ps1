
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/bostrot/wslmanager/releases/download/v2.6.1/wsl2-distro-manager-v2.6.1.zip'
    checksum64       = '9caf63f6156369445c727a10d6fc93e1c31a6858354cefdfc3d5802568614760'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs

$progsFolder = [Environment]::GetFolderPath('Programs')
If ( Test-ProcessAdminRights ) {
    $progsFolder = [Environment]::GetFolderPath('CommonPrograms')
}

Install-ChocolateyShortcut -shortcutFilePath (Join-Path -Path $progsFolder -ChildPath 'wsl2 distro manager.lnk') `
    -targetPath (Join-Path -Path $toolsDir -ChildPath "wsl2distromanager.exe")
