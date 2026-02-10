$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.26.0.windows-386.msi'
	checksum      = '82c87c3562eb6e31548d04e06a48edc43c94c0306b0a25e314d292deb964a9e0'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.26.0.windows-amd64.msi'
	checksum64    = 'cfb446aa6144566f3aac0e74f8a1b5d7936a2bfcd0ee47cc36afb0052db9c872'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
