$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://bootstrapstudio.io/releases/desktop/5.3.1/Bootstrap%20Studio.exe'
    checksum       = 'dd17fa6c09c73b4cf21b09ce14e99e96c38db16ef4bb8876e2f75d80ffecc490'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
