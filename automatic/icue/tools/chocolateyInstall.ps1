$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://downloads.corsair.com/Files/CUE/iCUESetup_4.21.173_release.msi'
  checksum      = 'ea5c05c977d6f2d8ff0315d98db84dd9b675c47a9c67f296e1687cdf9062beac'
  checksumType  = 'SHA256'

  softwareName  = 'icue*'

  silentArgs    = "/QN"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
