$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.16.6.windows-386.msi'
	checksum      = '89e31a7483ca1c71a8a508516e60792885b7d77a59b4f3991f891089090c97c5'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.16.6.windows-amd64.msi'
	checksum64    = '8caa75a1604a8519abc92a0ca55b60adfc675bb4eb13f1c9f6fab9cca54b617d'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
