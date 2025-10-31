$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url64         = 'https://github.com/dapr/cli/releases/download/v1.16.3/dapr.msi'
	checksum64    = '809db9f768f8c91e583a1032933030d6350c5f42ab911297ff9351570e754bf8'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 1641, 3010)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
