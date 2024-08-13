$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.23.0.windows-386.msi'
	checksum      = '803ef1d4f431d37ac8572ad9b0b65a4f945798208cd16b7f0588960e6b0949ba'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.23.0.windows-amd64.msi'
	checksum64    = '93e1cf580893303d0f6ac10647335de9f0768199d7027d8a361639cae6ab3145'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
