$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://cdn.localwp.com/releases-stable/10.0.0+6907/local-10.0.0-windows.exe'
    checksum       = 'b5b65621bd257688abaf44242a4101c5a75994ce1ef38398654fd842997233b2'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
