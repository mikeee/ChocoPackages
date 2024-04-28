
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/bostrot/wsl2-distro-manager/releases/download/v1.8.13/wsl2-distro-manager-v1.8.13.zip'
    checksum64       = '844abd083c7caa220f3e5ffc18c4dfba177e935eeb62bae68fce99272f1839f9'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs

$progsFolder = [Environment]::GetFolderPath('Programs')
If ( Test-ProcessAdminRights ) {
    $progsFolder = [Environment]::GetFolderPath('CommonPrograms')
}

Install-ChocolateyShortcut -shortcutFilePath (Join-Path -Path $progsFolder -ChildPath 'wsl2 distro manager.lnk') `
    -targetPath (Join-Path -Path $toolsDir -ChildPath "wsl2distromanager.exe")
