$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://dl.emsisoft.com/EmsisoftEmergencyKit.exe'
    checksum      = 'bd881e963f1fc4bf20495f00d9d53d843ff5172f452791a4629c2ac8d1ab2d53'
    checksumType  = 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '/s'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
