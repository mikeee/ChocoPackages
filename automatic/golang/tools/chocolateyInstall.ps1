$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.24.6.windows-386.msi'
	checksum      = '05fe19d4e04da8d4a41a72390921efb70b2d26c9f86ee2c90175c32d0f6a24fb'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.24.6.windows-amd64.msi'
	checksum64    = '2894552c0463e7c8c83bff00ace4345c71ad8808616ef963de4dca9e29e3773f'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
