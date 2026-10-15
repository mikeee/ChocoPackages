$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://cdn.localwp.com/releases-stable/10.2.0+7022/local-10.2.0-windows.exe'
    checksum       = 'e2a55dba29aaf14082c3873ecf8db0545c2e9462c97aecd3f275d556abe9f87b'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
