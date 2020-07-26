$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//WinMerge/winmerge/releases/download/2.16.7/winmerge-2.16.7-exe.zip'
    url64          = 'https://github.com//WinMerge/winmerge/releases/download/2.16.7/winmerge-2.16.7-x64-exe.zip'

    checksum       = '54364ad732d5189b5667d03860516b6a007c6dd45d21f15b95f69b7b84dcd15c'
    checksumType   = 'SHA256'
    checksum64     = 'ab97925b7c817bf507e0071cb5c5d2a85d38eefb6cb3c2519f85a1dd53a34a1e'
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
