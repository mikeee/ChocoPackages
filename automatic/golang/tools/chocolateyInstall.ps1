$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.23.2.windows-386.msi'
	checksum      = '72a6def70300cc804c70073d8b579603d9b39b39b02b3b5d340968d9e7e0e9d4'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.23.2.windows-amd64.msi'
	checksum64    = 'c80cbc5e66d6fb8b0c3300b0dda1fe925c429e199954d3327da2933d9870b041'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
