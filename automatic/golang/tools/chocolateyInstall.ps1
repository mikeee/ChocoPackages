$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.23.1.windows-386.msi'
	checksum      = '369a17f0cfd29e5c848e58ffe0d772da20abe334d1c7ca01dbcd55bb3db0b440'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.23.1.windows-amd64.msi'
	checksum64    = 'e99dac215ee437b9bb8f8b14bbfe0e8756882c1ed291f30818e8363bc9c047a5'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
