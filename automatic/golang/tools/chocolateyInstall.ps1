$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.19.1.windows-386.msi'
	checksum      = 'c3a0a751838a78e70afea13faf6226fd51f66ac42f350b4f5a3ff83307c701ce'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.19.1.windows-amd64.msi'
	checksum64    = 'd2e63b114c6bdd300078715e02589e3598f804c6b9d766a00a0a5c6a90a8ca89'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
