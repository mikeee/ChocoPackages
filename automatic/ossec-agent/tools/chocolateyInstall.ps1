$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  installerType  = 'exe'
  url            = 'https://updates.atomicorp.com/channels/atomic/windows/ossec-agent-win32-3.6.0-12032.exe'
  checksum       = '1dcaa817ce9b9fd992787b070fabc8e78c8fe13d07abe031e326b6b7dbb5e519'
  checksumType   = 'SHA256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
