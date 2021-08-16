$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.17.windows-386.msi'
	checksum      = 'e9680bb0d7b0f15fd9436f416eab6ef71c9e3ac65773b05c21f8fa384e9d25e1'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.17.windows-amd64.msi'
	checksum64    = '705254e0a459edae2c6bf4c88be0b4a14ac1cbbf9607a379112235f0271e6c4b'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
