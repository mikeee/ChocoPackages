$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://dl.emsisoft.com/EmsisoftEmergencyKit.exe'
    checksum      = '6a0f7d313ad9985bb8b43bc8ff76d2dba2584d1a6a02a9bc0cf264303d91db29'
    checksumType  = 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '/s'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
