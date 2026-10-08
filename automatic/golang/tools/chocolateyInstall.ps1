$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.27.2.windows-386.msi'
	checksum      = 'c0765105821d2fb884439fccd95befc7bd6e29a60bdf1e790464a68e6a888143'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.27.2.windows-amd64.msi'
	checksum64    = 'dc673c9207a83f95031549fafe72cc0b4c4554a1c16b373d875e90cf8d995ed9'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
