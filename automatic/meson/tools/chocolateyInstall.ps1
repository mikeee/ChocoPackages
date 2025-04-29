
$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName      = $env:ChocolateyPackageName
    url64            = 'https://github.com/mesonbuild/meson/releases/download/1.8.0/meson-1.8.0-64.msi'
    checksum64       = '127958545ec6594f1f32a5558b5b5699ad992b7f53ca42e4d45121d9a054beeb'
    checksumType64   = 'SHA256'
    fileType         = 'MSI'
    silentArgs       = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
    validExitCodes   = @(0)
}

Install-ChocolateyPackage @packageArgs
