$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.25.5.windows-386.msi'
	checksum      = '44870cb1925dbef808381a13c4737f062879ca467d685910c4b52370986908f4'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.25.5.windows-amd64.msi'
	checksum64    = 'f10d066ed3ccd7ab3d5d330eab6befc58f3e3dd665a2b5821ee93159ab04bf2f'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
