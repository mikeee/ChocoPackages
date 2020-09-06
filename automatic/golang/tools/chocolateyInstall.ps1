$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.15.1.windows-386.msi'
	checksum      = '0d652fc24135eeef21e5792e40db401f91777041ed0d335dca824fed51a6ce9d'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.15.1.windows-amd64.msi'
	checksum64    = 'cb815d57ecc701c401a600c6d0d5ac1bae4b3569f47963b90c405e79196f2d7d'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
