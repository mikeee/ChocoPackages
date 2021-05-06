$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.16.4.windows-386.msi'
	checksum      = 'a561574cc2c11d157feaf06f807a8c56a75dabcee688b95a7f7f826067385812'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.16.4.windows-amd64.msi'
	checksum64    = '9ae1cafad5f206f004cfe4e9e9b64e4710cb69c83f6221da89c113b6f2e8dec8'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
