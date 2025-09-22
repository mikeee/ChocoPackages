$installDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://download.clojure.org/install/clojure-tools-1.12.2.1571.zip'
  checksum       = '7fb20ae155a0d9853cbb62f5d997ed420aaf4cf2ce8dfcaa3802bb37e0fada1e'
  checksumType   = 'SHA256'
  unzipLocation  = $installDir
}

Install-ChocolateyZipPackage @packageArgs

if (-not ($env:PSModulePath.Contains($installDir))) {
  $psModulePath = [Environment]::GetEnvironmentVariable("PSModulePath")
  $psModulePath += $installDir
  [Environment]::SetEnvironmentVariable("PSModulePath",$psModulePath,[System.EnvironmentVariableTarget]::Machine)
}
