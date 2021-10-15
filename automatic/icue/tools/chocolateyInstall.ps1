$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://downloads.corsair.com/Files/CUE/iCUESetup_4.16.194_release.msi'
  checksum      = 'c6efb0a1f5bdb10de5f134c816ac9f648f874aa5159b63b7afce521c97454f85'
  checksumType  = 'SHA256'

  softwareName  = 'icue*'

  silentArgs    = "/QN"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
