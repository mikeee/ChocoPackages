$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.25.7.windows-386.msi'
	checksum      = '8c9cbfab99bdc2e4149c58c739ce03a50e2edcb18477dbc5b69c626c26a9a0ea'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.25.7.windows-amd64.msi'
	checksum64    = 'c6055334f2a72650e405806234c26bcb4c57911a8f1960de0c045bb66a732a84'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
