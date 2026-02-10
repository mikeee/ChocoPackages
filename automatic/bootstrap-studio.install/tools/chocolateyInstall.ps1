$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://releases.bootstrapstudio.io/8.0.0/Bootstrap%20Studio%20-%20Setup.exe'
    checksum       = 'cda1c57aae286907f97d201c2ecea287efdb0b10bbc32a9cbfc45177fbe01f60'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
