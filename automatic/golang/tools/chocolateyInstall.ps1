$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.22.2.windows-386.msi'
	checksum      = '6dcbe2a220f40aac331602a9f21286bacbba54d6300a9d729b5e14590ad880ac'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.22.2.windows-amd64.msi'
	checksum64    = 'b77536f7acfac29ece9137dfeb6423643aa57029b38bc93eb81c7f4882965b51'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
