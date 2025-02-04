$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://golang.org/dl/go1.23.6.windows-386.msi'
	checksum      = 'd00024e8bb7c1d5dfc5dff6808968a43ced8a7c9b7aeddf406a26ff8a576f37b'
	checksumType  = 'SHA256'
	url64         = 'https://golang.org/dl/go1.23.6.windows-amd64.msi'
	checksum64    = 'd2a587cbf856ed3e8583378cb43259d8e5e2aa663a21049ad0254fe19c22569f'
	checksumType64= 'SHA256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
