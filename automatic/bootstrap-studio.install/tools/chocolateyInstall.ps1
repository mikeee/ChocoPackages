$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://releases.bootstrapstudio.io/8.0.1/Bootstrap%20Studio%20-%20Setup.exe'
    checksum       = '8c763c1a0541e79a68536e02d5240398412a33b9724cb6c7fe5bdc8204eb59f9'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
