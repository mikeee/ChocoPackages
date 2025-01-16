$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.23.5.windows-386.msi'
	checksum      = '39962346d8d0cb0cc8716489ee33b08d7a220c24a9e45423487876dd4acbdac6'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.23.5.windows-amd64.msi'
	checksum64    = '03e11a988a18ad7e3f9038cef836330af72ba0a454a502cda7b7faee07a0dd8a'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
