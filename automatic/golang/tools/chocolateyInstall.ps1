$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.26.4.windows-386.msi'
	checksum      = 'c61c38054413ccbef9acddc0caa0acaaad49a9858f119a269265a5a18e894e8f'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.26.4.windows-amd64.msi'
	checksum64    = '55902c036634c7ab3159cf259af692abc86989aaefcc7f75bef888f3263031c4'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
