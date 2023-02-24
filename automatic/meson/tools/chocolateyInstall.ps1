
$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    url64            = 'https://github.com/mesonbuild/meson/releases/download/1.0.1/meson-1.0.1-64.msi'
    checksum64       = '9cd946dc4acbedb858bacab5cecacd8280f0c5c565efe59aa7d5a1f318bc2c0e'
    checksumType64   = 'SHA256'
    fileType         = 'MSI'
    silentArgs       = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
    validExitCodes   = @(0)
}

Install-ChocolateyPackage @packageArgs
