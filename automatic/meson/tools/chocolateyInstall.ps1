
$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    url64            = ''
    checksum64       = ''
    checksumType64   = 'SHA256'
    fileType         = 'MSI'
    silentArgs       = '/qn /norestart /l*v `"$(${ENV:TEMP})\$(${packageName}).$(${ENV:chocolateyPackageVersion}).MsiInstall.log`"'
    validExitCodes   = @(0)
}

Install-ChocolateyPackage @packageArgs
