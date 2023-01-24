$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url            = 'http://installer.jdownloader.org/JD2SilentSetup_x86.exe'
  checksum       = '44a43ca37cffd3ee30f06dba4117e8b2a10682cf6ee7bd217cd0133c6d9806bb'
  checksumType   = 'SHA256'
  url64          = 'http://installer.jdownloader.org/JD2SilentSetup_x64.exe'
  checksum64     = 'd08732950ee05f0aa7c346bb3cbe04195374a2949c01588955e2128d544722b6'
  checksumType64 = 'SHA256'
  silentArgs     = "-q"
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
