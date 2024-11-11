
$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    unzipLocation    = $toolsDir
    url64            = 'https://github.com/bostrot/wsl2-distro-manager/releases/download/v1.8.15/wsl2-distro-manager-v1.8.15.zip'
    checksum64       = 'f7e6e96a9a06f9f4f7300f13cb0594acb3b2f073e51925ce0cbe5d12624c459a'
    checksumType64   = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs

$progsFolder = [Environment]::GetFolderPath('Programs')
If ( Test-ProcessAdminRights ) {
    $progsFolder = [Environment]::GetFolderPath('CommonPrograms')
}

Install-ChocolateyShortcut -shortcutFilePath (Join-Path -Path $progsFolder -ChildPath 'wsl2 distro manager.lnk') `
    -targetPath (Join-Path -Path $toolsDir -ChildPath "wsl2distromanager.exe")
