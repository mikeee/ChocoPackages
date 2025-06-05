$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.24.4.windows-386.msi'
	checksum      = '966ecace1cdbb3497a2b930bdb0f90c3ad32922fa1a7c655b2d4bbeb7e4ac308'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.24.4.windows-amd64.msi'
	checksum64    = '0cbb6e83865747dbe69b3d4155f92e88fcf336ff5d70182dba145e9d7bd3d8f6'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
