$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.25.4.windows-386.msi'
	checksum      = 'f47eef5731606dc5ef0b59a9a2f7ae90f3b0843f54dc510c1d82900cd9bfa0b5'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.25.4.windows-amd64.msi'
	checksum64    = '4c08c06cb12e050b96c7e04b3fa622de28557f92e130f81106383e761b002652'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
