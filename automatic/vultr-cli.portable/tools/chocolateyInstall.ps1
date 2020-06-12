$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//vultr/vultr-cli/releases/download/v0.3.2/vultr-cli_0.3.2_windows_32-bit.zip'
    url64          = 'https://github.com//vultr/vultr-cli/releases/download/v0.3.2/vultr-cli_0.3.2_windows_64-bit.zip'

    checksum       = 'b03bf35f14f8a4f576a7844d0b13dddbc5f44a24b4f35d0e287ba6515157a523'
    checksumType   = 'SHA256'
    checksum64     = 'e7db75d0fae7e9aba8f77f710c57d85e0db3e9fe24f0fd4788905e2e69e529e0'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
