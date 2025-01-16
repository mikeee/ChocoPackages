$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://releases.bootstrapstudio.io/7.0.3/Bootstrap%20Studio%20-%20Setup.exe'
    checksum       = 'c650fcb22c4beef7bc29f7289467ddf3aa26e517ed09c90d6006c26b2a5c933d'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
