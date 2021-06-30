$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//hetznercloud/cli/releases/download/v1.25.0/hcloud-windows-386.zip'
    url64          = 'https://github.com//hetznercloud/cli/releases/download/v1.25.0/hcloud-windows-amd64.zip'

    checksum       = '6fba3bbf45cdf03d84d28ca63960fc45dc343d66b7857e43b89dfd164467e390'
    checksumType   = 'SHA256'
    checksum64     = 'f29a2a3d064152d29e996ab3903b18bff8bd194f7606219ab158fa55beb2092d'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
