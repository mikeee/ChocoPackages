$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.27.4.windows-386.msi'
	checksum      = 'd70f0c99c86ff5246b267738bbebee8faa3a448dd86643c3c1d76a98515de95d'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.27.4.windows-amd64.msi'
	checksum64    = 'ae9e383a027ac83c227efd0be3173bf98bccfa5d966a206dff7998f4a3d8449c'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
