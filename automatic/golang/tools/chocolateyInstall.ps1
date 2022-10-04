$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.19.2.windows-386.msi'
	checksum      = '98b0f92a6c74469353917afff914457d6809de164251ddb45831c3f0efc269b6'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.19.2.windows-amd64.msi'
	checksum64    = '249aba207df30133deadb3419b2476479189a2c0d324e72faee4e1f1a6209eca'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
