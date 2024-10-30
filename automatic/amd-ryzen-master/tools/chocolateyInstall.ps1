$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://download.amd.com/Desktop/amd-ryzen-master-2-14-1-3286.exe'
    checksum       = ''
    checksumType   = ''
    fileType       = 'EXE'
    silentArgs     = '/S /v/qn'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
