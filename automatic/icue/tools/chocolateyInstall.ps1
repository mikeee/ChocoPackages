$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://www3.corsair.com/software/CUE_V5/public/modules/windows/installer/Install%20iCUE.exe'
  checksum      = '5213B2BD8AC3D2B4D28F19FBBB9BFC994A22EC168C7E8ED8CC820A71F64683B2'
  checksumType  = 'SHA256'

  softwareName  = 'icue*'

  silentArgs    = "--quiet"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
