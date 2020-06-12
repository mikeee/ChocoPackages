$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = 'https://downloads.activestate.com/Komodo/releases/12.0.1/Komodo-IDE-12.0.1-91869.msi'
  checksum      = '9a6d8628add6cb2af32fa3dc5cdc8144495ee031ecc7364d08b85ad305b2077c'
  checksumType  = 'SHA256'

  softwareName  = 'komodo-ide'

  silentArgs    = "/quiet /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
Write-Verbose "Komodo IDE install log file is available at '$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log'"
