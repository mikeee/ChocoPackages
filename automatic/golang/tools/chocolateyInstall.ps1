$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.15.3.windows-386.msi'
	checksum      = '798adfac0c33df7b7e975438d356f87cf4eef6e17769b8d27c90ea1ebe9b8802'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.15.3.windows-amd64.msi'
	checksum64    = '366791843f0f29db97eb4ebfc0fd49ee42ecee9272655ea56ca94a8027ae8bdd'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
