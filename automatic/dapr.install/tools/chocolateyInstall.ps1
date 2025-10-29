$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url64         = 'https://github.com/dapr/cli/releases/download/v1.16.2/dapr.msi'
	checksum64    = '4784ac5148b2085e0112873e96776ed6a12054c500054ed7a02e380cc8559d5b'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 1641, 3010)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
