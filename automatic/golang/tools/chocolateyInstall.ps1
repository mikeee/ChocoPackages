$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.18.3.windows-386.msi'
	checksum      = 'a239bb663c31f2f3028c92860616741ac62a3eedd54d774e64e48b1bf5d615ef'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.18.3.windows-amd64.msi'
	checksum64    = '692ee6225305ad909630c9cc152719a9bdb332e911d180cf3143a5b6a09cc863'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
