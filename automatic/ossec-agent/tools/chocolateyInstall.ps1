$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  installerType  = 'exe'
  url            = 'https://updates.atomicorp.com/channels/atomic/windows/ossec-agent-win32-4.1.0-40639.exe'
  checksum       = '8c0728f18b3acbd0c66d0f61c556b532e686dc93e4daf7082a75a3f0f5fdfe06'
  checksumType   = 'SHA256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
