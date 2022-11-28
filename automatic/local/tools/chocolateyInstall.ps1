$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://cdn.localwp.com/releases-stable/6.5.2+6204/local-6.5.2-windows.exe'
    checksum       = 'b4f6c65f3cbb17f9ca5b52a6105ca049b87b73c0be0f4a48abb3e7c5048ff519'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
