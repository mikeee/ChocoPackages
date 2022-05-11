$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://bootstrapstudio.io/releases/desktop/6.0.1/Bootstrap%20Studio.exe'
    checksum       = '91a228513b05bf215ab18f0d62124e7e7a60450b660da69edadbdbd8d9206117'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
