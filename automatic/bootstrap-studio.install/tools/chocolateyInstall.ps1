$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://bootstrapstudio.io/releases/desktop/5.5.4/Bootstrap%20Studio.exe'
    checksum       = '263bd0d8beb113c4ddce80548cac19548abb18961c5851a77fd1886a2b2db7dc'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
