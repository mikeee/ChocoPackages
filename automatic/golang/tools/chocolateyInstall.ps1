$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.15.5.windows-386.msi'
	checksum      = '28fad44b732033302d14e10e2cff133fd35e02c8089f5b1b0d16572ab39aec2a'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.15.5.windows-amd64.msi'
	checksum64    = 'c20eb1e9e2976b59a379096867af7c632fa3a30d5b0c666ff037463e7fa0f65f'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
