$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.18.2.windows-386.msi'
	checksum      = '92bd0bd621fca209702d5dfd5ad88b78ae0467c5e1f7da99f6c7ef9ffbfeee29'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.18.2.windows-amd64.msi'
	checksum64    = '3c6ecea0966aedac4dd2e21a8db5d67b984d979f69670cb4a6d767c5e0160296'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
