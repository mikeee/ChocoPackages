$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url           = 'https://www3.corsair.com/software/CUE_V5/public/modules/windows/installer/Install%20iCUE.exe'
  checksum      = '3130E8CDC65AADFC6CD965D9E5F208C7D3A773D27A3EAD6962A63351966C2ADA'
  checksumType  = 'SHA256'

  softwareName  = 'icue*'

  silentArgs    = "--quiet"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
