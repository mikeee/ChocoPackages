$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//hetznercloud/cli/releases/download/v1.17.0/hcloud-windows-386.zip'
    url64          = 'https://github.com//hetznercloud/cli/releases/download/v1.17.0/hcloud-windows-amd64.zip'

    checksum       = '6a06543b914d2be9cf99f1861082eb6dbdb07e2f954c3de229988b67870adcbe'
    checksumType   = 'SHA256'
    checksum64     = '809c655fe7ed14167dac01625272f10d7ad291cd7e79d0e2e95b2cf8fdcff1ce'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
