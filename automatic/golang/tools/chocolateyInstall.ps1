$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.24.2.windows-386.msi'
	checksum      = '8a702d9f7104a15bd935f4191c58c24c0b6389e066b9d5661b93915114a2bef0'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.24.2.windows-amd64.msi'
	checksum64    = 'acefb191e72fea0bdb1a3f5f8f6f5ab18b42b3bbce0c7183f189f25953aff275'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
