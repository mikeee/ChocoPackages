$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = ''
  checksum       = ''
  checksumType   = 'sha256'
  unzipLocation  = "$env:ProgramFiles\PowerShell\Modules"
}

Install-ChocolateyZipPackage @packageArgs