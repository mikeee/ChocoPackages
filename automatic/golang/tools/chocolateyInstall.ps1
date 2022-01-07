$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.17.6.windows-386.msi'
	checksum      = '74633710c9e1c9a8f043ed2e4e6da1c687c57b5ce1c976e37c35e981ab32fc8c'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.17.6.windows-amd64.msi'
	checksum64    = '43a67c37be6699f3fc58c3d7f52cd0d6117d8777f65c79f73c44a58c6ed98f22'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
