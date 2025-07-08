$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.24.5.windows-386.msi'
	checksum      = 'eef0329bb25770ce2392c56a70e6074baff3c2ec38bb2619a6a199048617563a'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.24.5.windows-amd64.msi'
	checksum64    = '3394ab0a830727764b6a576cd84e1fe7640919730b706d42e5948af35b46cfc8'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
