$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://cdn.localwp.com/releases-stable/10.1.0+6912/local-10.1.0-windows.exe'
    checksum       = '0f605a2276978026cd93625017b4311a097baf835e8dbb1128b64c1c8c262ce4'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
