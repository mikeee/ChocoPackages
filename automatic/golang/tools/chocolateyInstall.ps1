$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.14.7.windows-386.msi'
	checksum      = '52df04dee059b0fc3c65af271daab2cfa5e1de57d2e204b53dc748f2224b5913'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.14.7.windows-amd64.msi'
	checksum64    = '2e0da6cc37b235f3bdeb91549ffeebe669391dadde7ff8d9da1921103dbfcb7b'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
