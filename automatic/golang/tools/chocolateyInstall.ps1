$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.15.7.windows-386.msi'
	checksum      = '1400f3a5a461214b97463167a8ee9f87b6f52d46e512f17cf5d9b77285b054f3'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.15.7.windows-amd64.msi'
	checksum64    = '548e73797f07c8f7dcd4e419f396a41702ab68d1bc82ff637587b94bcdc9a462'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
