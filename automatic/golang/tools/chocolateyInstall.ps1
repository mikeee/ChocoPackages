$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.26.3.windows-386.msi'
	checksum      = '762fb2194579bee625c22e7d1b56e9b8e78413368a924f04bea1e0d860e01264'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.26.3.windows-amd64.msi'
	checksum64    = '3b7c9c236086ac512cf09cb80c4437e18e585145297eaba713a3daca54709fc6'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
