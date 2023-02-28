$installDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://download.clojure.org/install/clojure-tools-1.11.1.1237.zip'
  checksum       = 'd773501d8c65dd4aec73709111085f3dd65b2477c4dd600a24a3a6f32664d637'
  checksumType   = 'SHA256'
  unzipLocation  = $installDir
}

Install-ChocolateyZipPackage @packageArgs

if (-not ($env:PSModulePath.Contains($installDir))) {
  $psModulePath = [Environment]::GetEnvironmentVariable("PSModulePath")
  $psModulePath += $installDir
  [Environment]::SetEnvironmentVariable("PSModulePath",$psModulePath,[System.EnvironmentVariableTarget]::Machine)
}
