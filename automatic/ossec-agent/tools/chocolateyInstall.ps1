$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  installerType  = 'exe'
  url            = 'https://updates.atomicorp.com/channels/atomic/windows/ossec-agent-win32-4.3.0-41650.exe'
  checksum       = 'd8deaa77a985504cd94e0765400cfb8a1253bcf8762b46e0f6c917f574db3820'
  checksumType   = 'SHA256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
