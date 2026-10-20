$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  installerType  = 'exe'
  url            = 'https://updates.atomicorp.com/channels/atomic/windows/ossec-agent-win32-4.4.1-42225.exe'
  checksum       = 'ddfb0aa3629fd3b651a218a5f6c1b5599e8f5e838500da05b8c79102b8b278ec'
  checksumType   = 'SHA256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
