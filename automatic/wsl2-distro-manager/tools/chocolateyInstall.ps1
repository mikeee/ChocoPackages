
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/bostrot/wsl2-distro-manager/releases/download/v2.0.3/wsl2-distro-manager-v2.0.3.zip'
    checksum64       = '119e05883bd2ef37f3ffaacc3544a872aa48918c95beaa6c44763f575e9346dc'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs

$progsFolder = [Environment]::GetFolderPath('Programs')
If ( Test-ProcessAdminRights ) {
    $progsFolder = [Environment]::GetFolderPath('CommonPrograms')
}

Install-ChocolateyShortcut -shortcutFilePath (Join-Path -Path $progsFolder -ChildPath 'wsl2 distro manager.lnk') `
    -targetPath (Join-Path -Path $toolsDir -ChildPath "wsl2distromanager.exe")
