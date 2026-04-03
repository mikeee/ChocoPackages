
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/bostrot/wsl2-distro-manager/releases/download/v1.11.0/wsl2-distro-manager-v1.11.0.zip'
    checksum64       = '3a914aaecf2f05f7a19f2f5738c392bf72c52796c985861f81d17d5b6ea4983c'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs

$progsFolder = [Environment]::GetFolderPath('Programs')
If ( Test-ProcessAdminRights ) {
    $progsFolder = [Environment]::GetFolderPath('CommonPrograms')
}

Install-ChocolateyShortcut -shortcutFilePath (Join-Path -Path $progsFolder -ChildPath 'wsl2 distro manager.lnk') `
    -targetPath (Join-Path -Path $toolsDir -ChildPath "wsl2distromanager.exe")
