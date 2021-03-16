$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://bootstrapstudio.io/releases/desktop/5.5.3/Bootstrap%20Studio.exe'
    checksum       = '1d69d4683f345ce4e46d574242060bef59c8146af5a38dd9a7d91ea80d46aaf9'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
