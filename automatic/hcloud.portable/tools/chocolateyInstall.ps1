$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//hetznercloud/cli/releases/download/v1.30.0/hcloud-windows-386.zip'
    url64          = 'https://github.com//hetznercloud/cli/releases/download/v1.30.0/hcloud-windows-amd64.zip'

    checksum       = '60c2363a2bde0803e3f21c3d40b4d529a0adc870751a3221d08e3c2b621f82fa'
    checksumType   = 'SHA256'
    checksum64     = '8378c69f499b9a8b2756758d0e33ac8d88d4f98d434697e7ac75f850a3367527'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
