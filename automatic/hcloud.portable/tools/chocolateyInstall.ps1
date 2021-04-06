$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//hetznercloud/cli/releases/download/v1.22.1/hcloud-windows-386.zip'
    url64          = 'https://github.com//hetznercloud/cli/releases/download/v1.22.1/hcloud-windows-amd64.zip'

    checksum       = 'db369c0af659998bc8b8a7765cd8ea62a8941f02365d28afbc1691d88727b8c6'
    checksumType   = 'SHA256'
    checksum64     = 'fdf15a1a706577f344c05b7c06268f414ed828e20c8f14b636efcb8d12c96d65'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
