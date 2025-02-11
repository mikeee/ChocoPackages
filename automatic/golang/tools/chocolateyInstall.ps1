$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.24.0.windows-386.msi'
	checksum      = 'f07677013cd7861c5e16067b0a82144c23c4bf72c139c762e142440f4c926f61'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.24.0.windows-amd64.msi'
	checksum64    = '4e78016d889431eb16aa0f87868cf52479b90059791c94a4ff45872d0573089e'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
