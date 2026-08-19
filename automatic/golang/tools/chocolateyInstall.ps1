$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.27.0.windows-386.msi'
	checksum      = 'a75fe7151e3d9c8c0d43759c92ae320525b49e238510b8fa082b32c1fadfd369'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.27.0.windows-amd64.msi'
	checksum64    = '728e9318c061b95082bcf167bab8b6c6e0d91a045f89f403b3285fa39f0c455b'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
