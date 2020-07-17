$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.14.6.windows-386.msi'
	checksum      = '286ee3b810fcbff542fe0457d6a4932ebe07c1ae279a70a88e887b3205b8f9f3'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.14.6.windows-amd64.msi'
	checksum64    = '6d3c766b1b57153ede6c763379884879d7fa779047549da07749a691d25cc9d2'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
