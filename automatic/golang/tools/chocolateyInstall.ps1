$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.20.3.windows-386.msi'
	checksum      = '9b7d44c4c4d50c386f81fcebfa48ffa792ddd12e54781321834259754ec2e374'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.20.3.windows-amd64.msi'
	checksum64    = '233e9ed046d5664131328a5a7e7f6dc0a4ab6d3fa0d17f8fc655a4a5bfef572d'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
