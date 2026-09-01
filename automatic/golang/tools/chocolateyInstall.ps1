$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.27.1.windows-386.msi'
	checksum      = 'c617339b397ba5c0d6bf785e68febeef46c8fceeadeebb81ddcb296d40fefac0'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.27.1.windows-amd64.msi'
	checksum64    = '54dbabbc910840fce0028779e896cd99a22bdf89463354a1ca0d9288044dc6e7'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
