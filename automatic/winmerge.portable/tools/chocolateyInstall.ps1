$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.56/winmerge-2.16.56-exe.zip'
    url64          = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.56/winmerge-2.16.56-x64-exe.zip'

    checksum       = '8a4b927f1a07ba59acd736c6f4d4d5a1ab36541d6d22db83c8c7a7c08db4adef'
    checksumType   = 'SHA256'
    checksum64     = 'f32de18a5d50f78ff1fc884b1dc6488809a8fcc8f3dcf197fc265a142d5e35c5'
    checksumType64 = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs

Get-ChildItem -Path $toolsDir -Filter "*.exe" -Recurse | ForEach-Object {
    $exe = $_.FullName
    if ($_.BaseName -eq 'winmergeu') {
      New-Item "${exe}.gui" -Type file -Force | Out-Null
    } else {
      New-Item "${exe}.ignore" -Type file -Force | Out-Null
    }
  }
