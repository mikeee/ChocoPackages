$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://dl.emsisoft.com/EmsisoftEmergencyKit.exe'
    checksum      = '3f7ec2f9b70c70b9468129637b35a1d0401fdaa0c24b90fa89c40376d9535a04'
    checksumType  = 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '/s'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
