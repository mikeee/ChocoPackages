$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.17.4.windows-386.msi'
	checksum      = '8133b12e5859469753f262e4c8671b5aa14674fd8ebc71b216a0c234a7c5662c'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.17.4.windows-amd64.msi'
	checksum64    = '581157e5141bbca55fb99959dbaee1ac1bce9a748ecac68fb315ca71c2487e33'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
