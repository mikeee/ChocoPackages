$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.15.8.windows-386.msi'
	checksum      = '80e07b56a3bbc22e4970c3c7232cdf97875c79f30120d9c202fc68590001455a'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.15.8.windows-amd64.msi'
	checksum64    = 'edc1bd458f090ac4823ec79181b350bd5446073b4432acaf2b326c85415d7daa'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
