$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://bootstrapstudio.io/releases/desktop/5.4.3/Bootstrap%20Studio.exe'
    checksum       = '0217ecbf8b5368f118a617e23a61db6687752bad8e45cc71edfcfd570469f7f5'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
