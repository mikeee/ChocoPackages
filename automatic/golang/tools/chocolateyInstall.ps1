$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://dl.google.com/go/go1.14.4.windows-386.msi'
	checksum      = '4bf30cca6d039ad4f5c43d7d1b4dfd35bd540d5e0c6a5c6d613844cc3bf8353b'
	checksumType  = 'SHA256'
	url64         = 'https://dl.google.com/go/go1.14.4.windows-amd64.msi'
	checksum64    = '213dd6fab7a45fd4ea52bce24ba9ab08f5a5225284e45303a590605db612966a'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
