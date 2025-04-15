$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url64          = 'https://github.com/dapr/cli/releases/download/v1.15.1/dapr_windows_amd64.zip'

    checksum64     = 'b961a3e712ddea86385b24550d80dff15ee654c5cab07e4965a41a17e246f696'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
