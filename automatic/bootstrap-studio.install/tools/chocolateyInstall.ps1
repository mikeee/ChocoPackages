$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://bootstrapstudio.io/releases/desktop/5.2.1/Bootstrap%20Studio.exe'
    checksum       = 'd0600b90dee952f603e22eeb92c4987e79d66e9bd615ac04991bf3d61b157f91'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
