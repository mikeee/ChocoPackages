$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.16.2.windows-386.msi'
	checksum      = '644bb475e520e2aef1d9905229faa2c90e46507f8ee8d8d0614f2525f40cf618'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.16.2.windows-amd64.msi'
	checksum64    = 'ad7c65aa63842e6a2ae15a32f01d1e0d8d79b032869203c7dd84e4891468719f'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
