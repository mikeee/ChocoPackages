$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.16.7.windows-386.msi'
	checksum      = 'a8e4ed71d5bc393884f981928c4ca74e95130a6d032a7ba3e414e8e2ac2b5710'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.16.7.windows-amd64.msi'
	checksum64    = '75597307c368ae1f728f9e7a2c2d5814225664b5b8d915d34c0d4eb2d53d0831'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
