$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://cdn.localwp.com/releases-stable/9.0.5+6706/local-9.0.5-windows.exe'
    checksum       = '4426c4862ab08f95cd502c08bc3d42ba18f079ef3af396c129901dab18173aa5'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
