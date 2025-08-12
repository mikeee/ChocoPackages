$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.25.0.windows-386.msi'
	checksum      = 'afd9e0a8d2665ff122c8302bb4a3ce4a5331e4e630ddc388be1f9238adfa8fe3'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.25.0.windows-amd64.msi'
	checksum64    = '936bd87109da515f79d80211de5bc6cbda071f2cc577f7e6af1a9e754ea34819'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
