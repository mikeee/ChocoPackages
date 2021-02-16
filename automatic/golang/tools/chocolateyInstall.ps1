$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.16.windows-386.msi'
	checksum      = '93b95aa7fa181153363a5f3a4448538b02312a12f2989249d4263c03defd9ec0'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.16.windows-amd64.msi'
	checksum64    = '0fd550a74f6c8ef5df405751f5e39a0ba25786930c5d61503bf71d3c3efa2414'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
