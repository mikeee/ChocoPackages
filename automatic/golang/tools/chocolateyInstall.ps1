$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.22.6.windows-386.msi'
	checksum      = 'a57821dab76af1ef7a6b62db1628f0caa74343e0c7cb829df9ce8ea0713a3e8e'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.22.6.windows-amd64.msi'
	checksum64    = '1238a3e6892eb8a0eb3fe0640e18ab82ca21cc1a933f16897b2ad081f057b5da'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
