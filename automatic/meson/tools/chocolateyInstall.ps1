
$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    url64            = 'https://github.com/mesonbuild/meson/releases/download/0.64.1/meson-0.64.1-64.msi'
    checksum64       = 'cdf20266a52e4c03dae8d4365a1603c979f9601b56159d3158bb3619d8dbf2d6'
    checksumType64   = 'SHA256'
    fileType         = 'MSI'
    silentArgs       = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
    validExitCodes   = @(0)
}

Install-ChocolateyPackage @packageArgs
