$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com/hetznercloud/cli/releases/download/v1.54.0/hcloud-windows-386.zip'
    url64          = 'https://github.com/hetznercloud/cli/releases/download/v1.54.0/hcloud-windows-amd64.zip'

    checksum       = '4571f11bfc9516bb31e4ecad40d9b5db8a033643f1e889325e15b118b719a2df'
    checksumType   = 'SHA256'
    checksum64     = '4f11aa95dc03bcc7c42062b26006345aac4c76ee981752093c9700e84ba1c6d3'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
