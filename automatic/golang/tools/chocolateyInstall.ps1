$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.17.2.windows-386.msi'
	checksum      = 'b954187e0d614f674b7f14e7fb6e754b7afe214a7aa9d6d70aa793afe0eacef8'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.17.2.windows-amd64.msi'
	checksum64    = 'f7d54883e9bb653b1a50061a7fa42a6503c680a25cee32f16ccba51a77b0c83b'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
