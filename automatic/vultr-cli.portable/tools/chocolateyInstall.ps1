$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url64          = 'https://github.com/vultr/vultr-cli/releases/download/v3.8.0/vultr-cli_v3.8.0_windows_amd64.zip'

    checksum64     = 'ccc356dd7f3e67744e1ada98943e9a77f983541f81060f75c87d8f24918f0c50'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
