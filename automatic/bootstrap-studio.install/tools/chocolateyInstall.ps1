$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://bootstrapstudio.io/releases/desktop/5.5.2/Bootstrap%20Studio.exe'
    checksum       = 'b7832a62992aa1637a7e29bcad5f4c371250ada35f4211022924d8a2e6128c06'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
