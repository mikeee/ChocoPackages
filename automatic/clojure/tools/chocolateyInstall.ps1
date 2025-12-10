$installDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://download.clojure.org/install/clojure-tools-1.12.4.1582.zip'
  checksum       = '4a16b810f9a4de8051d2d5c6c49a4f9878ad3abc1ccef83e86c48a66915e325d'
  checksumType   = 'SHA256'
  unzipLocation  = $installDir
}

Install-ChocolateyZipPackage @packageArgs

if (-not ($env:PSModulePath.Contains($installDir))) {
  $psModulePath = [Environment]::GetEnvironmentVariable("PSModulePath")
  $psModulePath += $installDir
  [Environment]::SetEnvironmentVariable("PSModulePath",$psModulePath,[System.EnvironmentVariableTarget]::Machine)
}
