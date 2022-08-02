$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.19.windows-386.msi'
	checksum      = '39ed9b03c42b0ee99477377c27b1a809a73b96c627d86c4aedd133e92df5bd43'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.19.windows-amd64.msi'
	checksum64    = '0743b5fe0c6e5c67c7d131a8e24d4e7bdd5ef272dd13205dd7ae30cc2f464123'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
