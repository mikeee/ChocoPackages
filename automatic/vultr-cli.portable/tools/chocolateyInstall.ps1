$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url64          = 'https://github.com/vultr/vultr-cli/releases/download/v3.2.0/vultr-cli_v3.2.0_windows_amd64.zip'

    checksum64     = 'ff3590b9e16fc7bf249ea60c3a3df48ccc68b59a0c58ff7cddbbe73914272749'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
