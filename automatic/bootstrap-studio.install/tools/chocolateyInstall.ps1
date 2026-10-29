$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://releases.bootstrapstudio.io/9.0.1/Bootstrap%20Studio%20-%20Setup.exe'
    checksum       = 'd95c82a67201869bbf60020e65597392c648f9c2521cefaa26a4e0ce51a84b18'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
