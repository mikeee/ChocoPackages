$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.25.3.windows-386.msi'
	checksum      = 'dfd8f7e534dc2f05627641d2df9a165c84fb5ee42eb322092c3f3d385a7aa71b'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.25.3.windows-amd64.msi'
	checksum64    = '370f08e90693eb9cdd5222351094627fd3be35a8a9230783573739f783a9482f'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
