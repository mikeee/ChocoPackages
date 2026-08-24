$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://cdn.localwp.com/releases-stable/10.1.2+7004/local-10.1.2-windows.exe'
    checksum       = '371062ef343f26dfdc9ad520ecc953401dcd9c69c6b0aef084c8e770a6807676'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
