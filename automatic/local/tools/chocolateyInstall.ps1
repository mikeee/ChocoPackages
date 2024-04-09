$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://cdn.localwp.com/releases-stable/9.0.1+6673/local-9.0.1-windows.exe'
    checksum       = '0c489c318b8e04429c51066bc69167eb8d04961b9a8f0ce6258c9e606c0a7354'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
