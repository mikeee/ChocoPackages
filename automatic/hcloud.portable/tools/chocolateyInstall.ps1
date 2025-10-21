$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com/hetznercloud/cli/releases/download/v1.55.0/hcloud-windows-386.zip'
    url64          = 'https://github.com/hetznercloud/cli/releases/download/v1.55.0/hcloud-windows-amd64.zip'

    checksum       = 'd6ce55557ba600607ff53c9a579dfc7527323f7e622a98cda8c36aebae57b63f'
    checksumType   = 'SHA256'
    checksum64     = 'd3a9697de8c61ab51a52856c0f7e92ac5eb78815383e106a6abba9d9f6e4a636'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
