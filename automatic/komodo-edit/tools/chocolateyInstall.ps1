$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName     = $env:ChocolateyPackageName
  fileType        = 'MSI'
  url64           = 'https://downloads.activestate.com/Komodo/releases/12.0.1/Komodo-Edit-12.0.1-18441.msi'
  checksum64      = '8d677839b7c3651f43df2c1e12ec5f2a6422e4e86b9617dab74563d470988d54'
  checksumType64  = 'SHA256'

  softwareName    = 'komodo-edit'

  silentArgs      = "/quiet /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
Write-Verbose "Komodo IDE install log file is available at '$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log'"
