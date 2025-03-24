$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://cdn.localwp.com/releases-stable/9.2.3+6776/local-9.2.3-windows.exe'
    checksum       = '16da15e37ec2ade238b8aee6771f08152e278c65837c3e4c48a58f7cd30bb995'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
