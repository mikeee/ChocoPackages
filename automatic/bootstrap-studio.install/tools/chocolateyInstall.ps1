$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://bootstrapstudio.io/releases/desktop/5.4.2/Bootstrap%20Studio.exe'
    checksum       = '36e338ed9454232c498babe19dd33f92c8ed3144ec2d2456e0df45b7f4675bf0'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
