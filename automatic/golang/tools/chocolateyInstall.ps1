$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.22.4.windows-386.msi'
	checksum      = '5c6446e2ea80bc6a971d2b34446f16e6517e638b0ff8d3ea229228d1931790b0'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.22.4.windows-amd64.msi'
	checksum64    = '3c21105d7b584759b6e266383b777caf6e87142d304a10b539dbc66ab482bb5f'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
