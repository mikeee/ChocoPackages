$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://download.amd.com/Desktop/AMD-Ryzen-Master.exe'
    checksum       = 'E998DDBBA7AF72D4D6AE9E673E668C0E272D5646078A8119E429EB12D7657560'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S /v/qn'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
