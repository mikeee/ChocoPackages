$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.19.3.windows-386.msi'
	checksum      = '8260ff43463470129804e3dd13c5728081ff617615913b69a10e8bcf77e5c709'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.19.3.windows-amd64.msi'
	checksum64    = '056177b590426bda3bdd7896b9dd36bd4b37211d16d46600dab1fb430b1132f1'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
