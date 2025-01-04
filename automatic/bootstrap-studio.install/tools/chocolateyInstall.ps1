$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://releases.bootstrapstudio.io/7.0.2/Bootstrap%20Studio%20-%20Setup.exe'
    checksum       = '33747f91dd6eb3f819e698e717e853dec0d2ecc35e937b31e03d36ad6d83defc'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
