$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.5.0/op_windows_386_v1.5.0.zip'
    url64          = 'https://cache.agilebits.com/dist/1P/op/pkg/v1.5.0/op_windows_amd64_v1.5.0.zip'

    checksum       = 'edbc02eddc0006d680f83f1db7641a6d2412c634ee3a7b75a3a1f19557ddc713'
    checksumType   = 'SHA256'
    checksum64     = 'b4cb8274f2119dea539ce98ad3c25b28c00d865c334c0456d961a01bcc644981'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
    
