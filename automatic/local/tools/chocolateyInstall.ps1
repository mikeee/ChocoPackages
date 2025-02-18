$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://cdn.localwp.com/releases-stable/9.2.2+6771/local-9.2.2-windows.exe'
    checksum       = '6978b605160053af644d79811ac8dd756aac4730bb8239cc6a500f53b33aad23'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
