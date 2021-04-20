$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://downloads.corsair.com/Files/CUE/iCUESetup_4.10.273_release.msi'
  checksum      = 'a9e8556c714e1b6e3fdf260857f27f61ad2bf218d3dc07d1d888de9131cfc94c'
  checksumType  = 'SHA256'

  softwareName  = 'icue*'

  silentArgs    = "/QN"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
