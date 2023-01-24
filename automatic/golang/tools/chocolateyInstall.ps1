$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.19.5.windows-386.msi'
	checksum      = 'f6dcfdb3ee4116b805ebcc44077557f36db3aa4d097a9fabfcf1648ebeac07df'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.19.5.windows-amd64.msi'
	checksum64    = '1ab2c4f1845617341c1d129c3fd201655792f861c6c3f610a7f82a9e7df2819a'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
