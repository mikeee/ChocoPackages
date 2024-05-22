$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://cdn.localwp.com/releases-stable/9.0.3+6684/local-9.0.3-windows.exe'
    checksum       = '926c23cfe6646658b377bada16b0df58c05a0f8a9bfa0668d9d88997ba6e980a'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
