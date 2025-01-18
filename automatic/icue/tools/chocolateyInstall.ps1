$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url           = 'https://www3.corsair.com/software/CUE_V5/public/modules/windows/installer/Install%20iCUE.exe'
  checksum      = 'EC9D3ED6C05A94DD3E551F6A170136A3E931F659C64BAC82885CD88A05D1656C'
  checksumType  = 'SHA256'

  softwareName  = 'icue*'

  silentArgs    = "--quiet"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
