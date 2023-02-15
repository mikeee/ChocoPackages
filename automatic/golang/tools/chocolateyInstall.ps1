$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.20.1.windows-386.msi'
	checksum      = 'f7bbd90ea7de3af63b9c3a2ef8bc0533c06a06fe8a803108416fda5fb6addf60'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.20.1.windows-amd64.msi'
	checksum64    = 'f06fdfa56f3aba62cbf80dacddbcc1150f4990cc117a9477047d3a3529ee3e80'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
