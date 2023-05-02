$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.20.4.windows-386.msi'
	checksum      = '03bdb95782028af5140233de1649d5e1b76b046955502f9c51fc364dc1ac4c5c'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.20.4.windows-amd64.msi'
	checksum64    = 'd9f24142072ec50b06325b317b9f40e7c50b7a22949f55b39b467718193c6e46'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
