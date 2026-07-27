$installDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://download.clojure.org/install/clojure-tools-1.12.5.1664.zip'
  checksum       = 'eb493fbef4cd8d5a77457f46e6c4538d89337c875da4fc9f086f183426a2a233'
  checksumType   = 'SHA256'
  unzipLocation  = $installDir
}

Install-ChocolateyZipPackage @packageArgs

if (-not ($env:PSModulePath.Contains($installDir))) {
  $psModulePath = [Environment]::GetEnvironmentVariable("PSModulePath")
  $psModulePath += $installDir
  [Environment]::SetEnvironmentVariable("PSModulePath",$psModulePath,[System.EnvironmentVariableTarget]::Machine)
}
