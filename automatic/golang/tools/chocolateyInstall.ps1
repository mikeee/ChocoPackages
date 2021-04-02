$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.16.3.windows-386.msi'
	checksum      = '75c501ce9c7e542653da034db02d8d9dc6cecef2804df9fc9cc6f90708a02d8c'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.16.3.windows-amd64.msi'
	checksum64    = '850cf9e4b0ab0369ab2750c6ab25725b6a298490d09bf3fde61b08f770328f4c'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
