$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.20.windows-386.msi'
	checksum      = '37d7279cd68817c416661280c5daabe8298cf76c631e38aaebe9d1efeaf4257b'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.20.windows-amd64.msi'
	checksum64    = '179ec1b55d3c1b014595a72fc5f7f59d7c00f9732cc227b47dfe13e6cc633c7c'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
