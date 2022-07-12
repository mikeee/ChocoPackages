$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.18.4.windows-386.msi'
	checksum      = '2047f4e781b18ffe2b6a3649f804e5bda4fdbb071041a99ad20742187f523f23'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.18.4.windows-amd64.msi'
	checksum64    = '8ac1d7d03a2c785623f6370e84de7ab42b2d077cf7c14915f408dae76260dbf7'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
