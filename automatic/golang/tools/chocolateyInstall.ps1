$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.26.2.windows-386.msi'
	checksum      = '9a63074567b8a0a94091e8f6c2096f5d4d0369c7bbaed08158a63004d8b8cac1'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.26.2.windows-amd64.msi'
	checksum64    = '84826eca833548bb2beabe7429052eaaec18faa902fde723898d906b42e59a73'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
