
$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    url64            = 'https://github.com/mesonbuild/meson/releases/download/1.11.0/meson-1.11.0-64.msi'
    checksum64       = 'ea8f6e328294fd2adc508a10d3a656b3c00c83cadc619a18fba19f2b589c3101'
    checksumType64   = 'SHA256'
    fileType         = 'MSI'
    silentArgs       = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
    validExitCodes   = @(0)
}

Install-ChocolateyPackage @packageArgs
