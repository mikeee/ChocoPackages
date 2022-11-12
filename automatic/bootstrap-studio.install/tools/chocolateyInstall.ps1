$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://releases.bootstrapstudio.io/6.2.1/Bootstrap%20Studio.exe'
    checksum       = ''
    checksumType   = ''
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
