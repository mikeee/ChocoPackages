$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.22.3.windows-386.msi'
	checksum      = '589fa5de9f7a2afffb4d98535e7da5e1b21e8367abbae35168ca52fd71db6a4f'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.22.3.windows-amd64.msi'
	checksum64    = '11f1a4a65c90088e942cef4cbf286e07fd5e04f0a3e677646459415daafa0f4b'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
