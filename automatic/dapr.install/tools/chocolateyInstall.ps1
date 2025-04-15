$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url64         = 'https://github.com/dapr/cli/releases/download/v1.15.1/dapr.msi'
	checksum64    = 'e4263ee31fe3f215b34d78e3bb437d9c79aeed8ae0bb026b2fce71e6a50577bb'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 1641, 3010)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
