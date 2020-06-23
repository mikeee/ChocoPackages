$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = ''
    checksum      = ''
    checksumType  = 'SHA256'
    url64         = ''
    checksum64    = ''
    checksumType64= 'SHA256'
    fileType      = 'EXE'
    silentArgs    = 'OMAHA=1'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
