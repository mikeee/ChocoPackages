$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://releases.bootstrapstudio.io/9.0.0/Bootstrap%20Studio%20-%20Setup.exe'
    checksum       = '187d77991b1830018549d7cd09695fb5e66f19d6cc42f87718910c3b7b12bbd6'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
