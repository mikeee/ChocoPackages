$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.22.5.windows-386.msi'
	checksum      = '3ec89ed822b38f4483977a90913fbe39d0857f0ed16c4642dec1950ddbe8c943'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.22.5.windows-amd64.msi'
	checksum64    = '86b0299ab8cb9c44882a9080dac03f7f4d9546f51ed1ba1015599114bcbc66d0'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
