$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://download.amd.com/Desktop/AMD-Ryzen-Master.exe'
    checksum       = '0006C60C686279217440234ACC5CA35E141C0756A13A70F734A563BFB02BB0AC'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S /v/qn'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
