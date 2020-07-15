$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://bootstrapstudio.io/releases/desktop/5.1.1/Bootstrap%20Studio.exe'
    checksum       = '8d9d115de289c3d6b1b917fd7fd40e20182fcf9bfe9611c95c47d1accff5e00a'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
