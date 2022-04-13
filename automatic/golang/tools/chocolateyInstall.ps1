$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.18.1.windows-386.msi'
	checksum      = 'f32ff4cf38a2d0cbc5ab5617742973c3f369755c142b4cf3f3e4ac5b9d10c200'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.18.1.windows-amd64.msi'
	checksum64    = '9a3e9636eb5f9af4b3b29b116b7d28b8d6092c690ee4b88cfb9613b8851d4a66'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
