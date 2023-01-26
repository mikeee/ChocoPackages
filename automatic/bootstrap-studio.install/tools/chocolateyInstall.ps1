$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://releases.bootstrapstudio.io/6.3.1/Bootstrap%20Studio.exe'
    checksum       = '2d0bd0a840a932d0e308f2760c3666c0c2e08b34aa064e5081c5944e0ac6515f'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
