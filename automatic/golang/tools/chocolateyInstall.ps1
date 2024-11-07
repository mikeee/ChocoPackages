$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.23.3.windows-386.msi'
	checksum      = '14b7baf4af2046013b74dfac6e9a0a7403f15ee9940a16890bc028dfd32c49ac'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.23.3.windows-amd64.msi'
	checksum64    = '614f0e3eed82245dfb4356d4e8d5b96abecca6a4c4f0168c0e389e4dd6284db8'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
