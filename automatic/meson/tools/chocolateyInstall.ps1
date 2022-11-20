
$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    url64            = ''
    checksum64       = ''
    checksumType64   = 'SHA256'
    fileType         = 'MSI'
    silentArgs       = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
    validExitCodes   = @(0)
}

Install-ChocolateyPackage @packageArgs
