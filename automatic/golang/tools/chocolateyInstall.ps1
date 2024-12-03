$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.23.4.windows-386.msi'
	checksum      = 'e5865c1bfc3fee5d003819b2e2c800f598fe9994931bac63f573e8d05a10d91f'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.23.4.windows-amd64.msi'
	checksum64    = '5f8cc5991eb8f4f96b6c611d839453cd11c9a2c3f23672a4188342c97ee159fa'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
