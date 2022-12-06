$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.19.4.windows-386.msi'
	checksum      = 'bea9b95104a99a2d840a6aae7ca7d20c0479684e38fe09ef00816f3808785a70'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.19.4.windows-amd64.msi'
	checksum64    = 'cffae9219ee1e8285aecf7038054be25c6a6460c79813d5658bee26640600233'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
