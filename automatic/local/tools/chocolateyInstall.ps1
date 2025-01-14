$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://cdn.localwp.com/releases-stable/9.2.0+6762/local-9.2.0-windows.exe'
    checksum       = 'd179f40799a02a4b866fbe722610a6fba22f788bf208e3ccf5ebabe83c2d1896'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
