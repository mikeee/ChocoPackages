$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.15.4.windows-386.msi'
	checksum      = '361807f07e5999cf1344c342b258c74e23e9e0bb74eb12762e142a1c80012f6c'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.15.4.windows-amd64.msi'
	checksum64    = 'c8917a084a1d46bf6d041315f976d1cda65e46e5905f3436562fe88f19066ba6'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
