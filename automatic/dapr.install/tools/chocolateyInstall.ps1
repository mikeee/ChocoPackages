$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url64         = 'https://github.com/dapr/cli/releases/download/v1.18.0/dapr.msi'
	checksum64    = 'be4a88072fdd2bdfb93bb0dcfe3eb620fa53c1ac13dcbacdd237a4ab893edf92'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 1641, 3010)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
