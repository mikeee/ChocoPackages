$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://cdn.localwp.com/releases-stable/9.2.5+6810/local-9.2.5-windows.exe'
    checksum       = 'c06ddfd94299427bd76ab4d154724ca28d8755db75d7fb1c235f9bd1fe54fe1f'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
