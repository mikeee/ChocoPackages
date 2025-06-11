
$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    url64            = 'https://github.com/mesonbuild/meson/releases/download/1.8.2/meson-1.8.2-64.msi'
    checksum64       = '073aa91e3f716cd49f1f37adbc767cad5a62ff4f3780c07838054aa93a23363f'
    checksumType64   = 'SHA256'
    fileType         = 'MSI'
    silentArgs       = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
    validExitCodes   = @(0)
}

Install-ChocolateyPackage @packageArgs
