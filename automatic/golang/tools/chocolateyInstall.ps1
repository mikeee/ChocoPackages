$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.16.1.windows-386.msi'
	checksum      = 'c31917732f1bd0084a33a23ce1b05136b7d76e75029357b1ffe5f60eb735c1f5'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.16.1.windows-amd64.msi'
	checksum64    = 'd90561184fae94c1e9054107067635fd2f8249f13195685ced6c5fdf4bfd57bb'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
