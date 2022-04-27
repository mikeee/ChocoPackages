$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://downloads.corsair.com/Files/CUE/iCUESetup_4.23.137_release.msi'
  checksum      = '95e52e6989f51d1e5c0ce9c397e022626227137958c12e87bb549b8411afe75c'
  checksumType  = 'SHA256'

  softwareName  = 'icue*'

  silentArgs    = "/QN"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
