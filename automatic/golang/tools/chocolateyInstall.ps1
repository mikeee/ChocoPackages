$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.26.7.windows-386.msi'
	checksum      = '4aed655c8146bf8a82682a72ec081424c76f5dd884b6575cf45d2b811d910926'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.26.7.windows-amd64.msi'
	checksum64    = 'c6e7aa52fa607f93e6e3a7e2ffd733782f3bdb2aa8cd0559a6cd9927aef49c34'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
