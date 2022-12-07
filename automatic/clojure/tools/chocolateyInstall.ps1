$installDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = ''
  checksum       = ''
  checksumType   = 'sha256'
  unzipLocation  = $installDir
}

Install-ChocolateyZipPackage @packageArgs

$psModulePath = [Environment]::GetEnvironmentVariable("PSModulePath")
$psModulePath += $installDir
[Environment]::SetEnvironmentVariable("PSModulePath",$psModulePath)