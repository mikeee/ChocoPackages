$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url           = 'https://www3.corsair.com/software/CUE_V5/public/modules/windows/installer/Install%20iCUE.exe'
  checksum      = 'B9D8BF509AA04B0631392524B4F2692166DA0623C701D7A7055821A8A95E8BD9'
  checksumType  = 'SHA256'

  softwareName  = 'icue*'

  silentArgs    = "--quiet"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
