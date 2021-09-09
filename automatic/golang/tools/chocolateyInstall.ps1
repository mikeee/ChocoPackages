$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.17.1.windows-386.msi'
	checksum      = '156cf3b489655df7795b0dbe6d39fdf006b4932e3449fa2f07db56999ed623f0'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.17.1.windows-amd64.msi'
	checksum64    = '7a360967708350354ea479500a8eada6a032e07eac5bd43142367ee5b0ab1df9'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
