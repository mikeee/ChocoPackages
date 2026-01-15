$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.25.6.windows-386.msi'
	checksum      = '672c7e5f64b0457afc44cf2d6f7633d0c81aebc46955334a29810bbd40c3fc28'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.25.6.windows-amd64.msi'
	checksum64    = '8368bc6e1eeef015bda240a1f47f244be39a3f285c1c6f2a00c155bc3b5c26b3'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
