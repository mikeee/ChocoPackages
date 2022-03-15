$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.18.windows-386.msi'
	checksum      = '33f0d72f645d31256873225385700fa32ddb572acef8304548b869823384abd7'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.18.windows-amd64.msi'
	checksum64    = '57cba0010ce3bc8012cfa68ab0e11181ccd8493a66b109a5b86998e5d2b38ae1'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
