$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  installerType  = 'exe'
  url            = 'https://updates.atomicorp.com/channels/atomic/windows/ossec-agent-win32-4.2.0-41214.exe'
  checksum       = '2144898d48e641b1f0759e3d9765df5f3fcf1fd2e617de0e2f31fef757e64f98'
  checksumType   = 'SHA256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
