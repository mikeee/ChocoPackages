$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com/hetznercloud/cli/releases/download/v1.53.0/hcloud-windows-386.zip'
    url64          = 'https://github.com/hetznercloud/cli/releases/download/v1.53.0/hcloud-windows-amd64.zip'

    checksum       = 'e3fbaf3c681c2109b9609cedfdd8ad8bc8fba44b7f6f2f7cb102f7068447a8ae'
    checksumType   = 'SHA256'
    checksum64     = 'e712716280593fe978566998779172970bca8487bfd24bc0de041bf76f9cfbf2'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
