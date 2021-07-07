$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://downloads.corsair.com/Files/CUE/iCUESetup_4.13.223_release.msi'
  checksum      = 'd6aaf8378b13cac48aea566dd07971ea279706427439dd9698601545bf54e3a5'
  checksumType  = 'SHA256'

  softwareName  = 'icue*'

  silentArgs    = "/QN"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
