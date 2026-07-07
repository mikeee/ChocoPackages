$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.26.5.windows-386.msi'
	checksum      = 'fe20b9d7cc23c9f1afb702a7f04161d75055cd6d58c783d9ad3381e4e83fe9b8'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.26.5.windows-amd64.msi'
	checksum64    = 'd554dc209403b101225fc2b54647ef47df09bea23291b1246fe1b35198f55f50'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
