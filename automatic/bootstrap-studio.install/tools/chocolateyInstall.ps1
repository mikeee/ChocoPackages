$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://bootstrapstudio.io/releases/desktop/5.3.0/Bootstrap%20Studio.exe'
    checksum       = 'bbf67d9c74b93245735832fa69cde7cc4c65bbd015fd59a971aa64fe55b68d72'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
