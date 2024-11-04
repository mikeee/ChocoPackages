$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://www3.corsair.com/software/CUE_V5/public/modules/windows/installer/Install%20iCUE.exe'
  checksum      = '57D84F65823B834BED4D3AE2BA435314E928C8D035712D05BAFF09318309F922'
  checksumType  = 'SHA256'

  softwareName  = 'icue*'

  silentArgs    = "--quiet"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
