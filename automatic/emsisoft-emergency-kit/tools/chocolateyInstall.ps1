$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://dl.emsisoft.com/EmsisoftEmergencyKit.exe'
    checksum      = '3692b527b6082a6efffa3600056db4e08823c540c18c31cb80c8f8051abdb8f9'
    checksumType  = 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '/s'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
