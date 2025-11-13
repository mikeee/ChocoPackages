$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  file           = Get-Item "$toolsDir\*.exe"
  silentArgs     = "-q"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
