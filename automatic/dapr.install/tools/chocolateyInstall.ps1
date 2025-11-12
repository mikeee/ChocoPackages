$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url64         = 'https://github.com/dapr/cli/releases/download/v1.16.5/dapr.msi'
	checksum64    = '09f7f6ce899f3c7a58322cb0552b64257d8a104780392ea3377834cd62774fae'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 1641, 3010)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
