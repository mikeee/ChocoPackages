$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = ''
    url64          = ''
    checksum 	   = ''
    checksumType   = 'SHA256'
    checksum64 	   = ''
    checksumType64 = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '--mode unattended --install_for all'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
