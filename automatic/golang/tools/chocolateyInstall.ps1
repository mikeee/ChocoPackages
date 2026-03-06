$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.26.1.windows-386.msi'
	checksum      = '3ccd657861c32e9552de83e1abc88e68df87add99ee068dfb860268a216c15f5'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.26.1.windows-amd64.msi'
	checksum64    = '9b1ffb28d6e934bf7683b09b01e1843e9b4baab89c119a81de59b851bd01bf73'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
