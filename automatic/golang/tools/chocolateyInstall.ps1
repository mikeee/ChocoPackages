$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.17.8.windows-386.msi'
	checksum      = '0f2f9f8b33379378299a99a4960b94071deae295475f0e34ab8bc0c511e6da54'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.17.8.windows-amd64.msi'
	checksum64    = '40f672ec28ec9108edb60d1207a6c5ce83adac1d5c767dc4b5e0f54bae069e03'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
