$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.15.2.windows-386.msi'
	checksum      = 'fadab96ca321033d8d16c7052870bb875872e2eb72e198f30564356e801fbb89'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.15.2.windows-amd64.msi'
	checksum64    = 'e31682789439bcc8c24ef5129c56f1558647822a03feb0c3ed7d48b9a8e22d97'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
