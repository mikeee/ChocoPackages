$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.14.5.windows-386.msi'
	checksum      = 'c5c72c355958b3097884f62d213892f6eb5eb63add4098e53d73cca2aa06c04a'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.14.5.windows-amd64.msi'
	checksum64    = 'f18964960f921e786a9321361af95fd12537881b24c619fbf9381430005ed7cc'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
