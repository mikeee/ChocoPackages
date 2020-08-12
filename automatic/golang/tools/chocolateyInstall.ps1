$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.15.windows-386.msi'
	checksum      = '33780d3a21b05fc0bb9f76380390d3233bc62347ea58349c6317ffadd8cb2429'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.15.windows-amd64.msi'
	checksum64    = '02944771ca3cffe7bcda85c6ec16eb6dac94e4b1c877cceb610ecab92d4e0a32'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
