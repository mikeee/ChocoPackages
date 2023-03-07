$installDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://download.clojure.org/install/clojure-tools-1.11.1.1252.zip'
  checksum       = '055f07b9de1ed4e91ee14ef361752fb4fbdaec1f954e7e9b339f24ee6cff4c56'
  checksumType   = 'SHA256'
  unzipLocation  = $installDir
}

Install-ChocolateyZipPackage @packageArgs

if (-not ($env:PSModulePath.Contains($installDir))) {
  $psModulePath = [Environment]::GetEnvironmentVariable("PSModulePath")
  $psModulePath += $installDir
  [Environment]::SetEnvironmentVariable("PSModulePath",$psModulePath,[System.EnvironmentVariableTarget]::Machine)
}
