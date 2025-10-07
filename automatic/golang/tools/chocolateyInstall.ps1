$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.25.2.windows-386.msi'
	checksum      = '960814e5caa9f90ce95af62b1cde19fee75b7b525f95e69b9f528f126859a158'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.25.2.windows-amd64.msi'
	checksum64    = '3f54576fbbf52f8e3b3b879cc00fb9f5b048fb8ca8b51ee6defc7418d11a0056'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
