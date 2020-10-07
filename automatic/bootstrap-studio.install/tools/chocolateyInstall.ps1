$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://bootstrapstudio.io/releases/desktop/5.4.0/Bootstrap%20Studio.exe'
    checksum       = '93fdb020da2b35beb44d09d5aabf2ebba81fe9a77eb569f31bd41bf237eb6122'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
