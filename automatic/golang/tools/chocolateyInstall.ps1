$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.24.1.windows-386.msi'
	checksum      = 'db128981033ac82a64688a123f631e61297b6b8f52ca913145e57caa8ce94cc3'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.24.1.windows-amd64.msi'
	checksum64    = '5968e7adcf26e68a54f1cd41ad561275a670a8e2ca5263bc375b524638557dfb'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
