$installDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url            = 'https://download.clojure.org/install/clojure-tools-1.11.1.1200.zip'
  checksum       = '6d121c6712d31c2fef2fbf477da22ff5b183a9687c698ffb79d094719d9c391e'
  checksumType   = 'SHA256'
  unzipLocation  = $installDir
}

Install-ChocolateyZipPackage @packageArgs

$psModulePath = [Environment]::GetEnvironmentVariable("PSModulePath")
$psModulePath += $installDir
[Environment]::SetEnvironmentVariable("PSModulePath",$psModulePath)
