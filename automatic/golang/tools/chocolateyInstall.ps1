$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.27.3.windows-386.msi'
	checksum      = '0b6fc50b3c8c849d41004bbafa3cd1ecca0a2986d338a2332fee29aa05180d4d'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.27.3.windows-amd64.msi'
	checksum64    = '89ec8325f667c674fe1b94a5a88e26932aa12323589881927ff54da99d4b7faa'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
