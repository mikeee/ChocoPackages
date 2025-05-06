$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.24.3.windows-386.msi'
	checksum      = '0d7e7dc0a31ba0cdd487415709d03b02fc9490ef111e8dfd22788a6d63316f37'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.24.3.windows-amd64.msi'
	checksum64    = 'd5b7637e7e138be877d96a4501709d480e050d86a8f402bc950e72112b5aedc5'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
