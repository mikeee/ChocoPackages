$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.26.6.windows-386.msi'
	checksum      = '5afc79412fe097060653a7cf46ca99a39727eae02a9660bb3295ab7a12bf2f0d'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.26.6.windows-amd64.msi'
	checksum64    = '7c1390d3ab814753c3176bc0e0648ff70d3c2b4c3b22cced9c347f40dc920168'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
