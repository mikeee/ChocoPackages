$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://releases.bootstrapstudio.io/6.3.0/Bootstrap%20Studio.exe'
    checksum       = '63c5562b7bf9f83684abb58a392aa9ad8d3d713d92d70334e4fb356e42b647bd'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
