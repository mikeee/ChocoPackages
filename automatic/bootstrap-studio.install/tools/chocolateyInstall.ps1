$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://bootstrapstudio.io/releases/desktop/5.9.3/Bootstrap%20Studio.exe'
    checksum       = '2dbd9ea03742a271beb396f6c71751fc699b80383dcb4d8bc7f81384419747a1'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
