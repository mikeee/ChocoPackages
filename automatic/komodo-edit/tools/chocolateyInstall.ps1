$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName     = $env:ChocolateyPackageName
  fileType        = 'MSI'
  url64           = ''
  checksum64      = ''
  checksumType64  = 'SHA256'

  softwareName    = 'komodo-edit'

  silentArgs      = "/quiet /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
Write-Verbose "Komodo IDE install log file is available at '$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log'"
