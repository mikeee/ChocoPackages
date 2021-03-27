$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://bootstrapstudio.io/releases/desktop/5.6.0/Bootstrap%20Studio.exe'
    checksum       = '9ecb0b245a9e710801a06fed5f88485bf261f5eb5e60295964c358e9109a1d68'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
