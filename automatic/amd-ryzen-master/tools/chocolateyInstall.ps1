$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://download.amd.com/Desktop/AMD-Ryzen-Master.exe'
    checksum       = 'FE851809A404E95ED192DB549742615E4466DB97B7B8333C5919BF3DEE923B9F'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S /v/qn'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
