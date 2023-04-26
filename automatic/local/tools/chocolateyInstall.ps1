$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://cdn.localwp.com/releases-stable/6.7.1+6369/local-6.7.1-windows.exe'
    checksum       = 'f94e56f835cc63db59d18e830fe36c28d7c503bdbc58bc4eb640674ab4dae6b9'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
