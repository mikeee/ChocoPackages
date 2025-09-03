$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.25.1.windows-386.msi'
	checksum      = '301952733f5ceeba1793fe65001bc0cd8d3f1899713e53f5314dbb7c864ebaf4'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.25.1.windows-amd64.msi'
	checksum64    = 'c9b5057b918862849ef83795ad5ace4812363ce3877e99863be759715571dbc1'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
