$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://download.amd.com/Desktop/AMD-Ryzen-Master.exe'
    checksum       = '448E5C5BAA024C202EEA5B0EED3B75DFF3E9ABA216CDBE3181D64C946372BA65'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S /v/qn'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
