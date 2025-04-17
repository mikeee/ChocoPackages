$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://cdn.localwp.com/releases-stable/9.2.4+6788/local-9.2.4-windows.exe'
    checksum       = '1a8a74c7e572f53d9800abf6fbf804ed618d6df38dd1889db5a8a32c95db5ca8'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
