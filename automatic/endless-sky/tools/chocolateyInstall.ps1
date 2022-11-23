$ErrorActionPreference = 'Stop'

$toolsDir   = Join-Path -Path (Get-ToolsLocation) -ChildPath 'endless-sky'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = ''
    url64          = ''
    checksum       = ''
    checksumType   = 'SHA256'
    checksum64     = ''
    checksumType64 = 'SHA256'

    unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs