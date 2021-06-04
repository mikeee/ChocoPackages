$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.16.5.windows-386.msi'
	checksum      = 'b9b8d0346418ccc25bd23b9a2af29f1c172149453289fe4fc4a8bf35b8af368d'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.16.5.windows-amd64.msi'
	checksum64    = '322dd8c585f37b62c9e603c84747b97a7a65b56fcef56b64e3021ccad90785b2'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
