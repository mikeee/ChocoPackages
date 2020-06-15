$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://bootstrapstudio.io/releases/desktop/5.1.0/Bootstrap%20Studio.exe'
    checksum       = 'ebf7d5cbd4614e7ce4b47feb884f6d2a761dd36915eb6c39953c143bfcc1543f'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
