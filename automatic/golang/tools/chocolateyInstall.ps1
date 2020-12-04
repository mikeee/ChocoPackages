$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.15.6.windows-386.msi'
	checksum      = '968e08c7bbdec292725f0419219cad6d6f1f516374346ec88c18fb1a09031466'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.15.6.windows-amd64.msi'
	checksum64    = 'bedc8243116297d14a8ba15fcb280e7419dcf344a957263e2c815d74d463397e'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
