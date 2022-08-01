$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.18.5.windows-386.msi'
	checksum      = '9a11bb03f1c00304e8e350d6f3a3173376ae72ee0997b9f587aba1f1a516aefe'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.18.5.windows-amd64.msi'
	checksum64    = 'e98fa9dbf35666362d2ed814ec681a9dd072e690efa334bdaab0339f81f625a7'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
