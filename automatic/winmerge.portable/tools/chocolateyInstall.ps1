$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.21/winmerge-2.16.21-exe.zip'
    url64          = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.21/winmerge-2.16.21-x64-exe.zip'

    checksum       = '9267738f8aaa158321e2a6c82d63d88983297423e767f2212318988addf8b322'
    checksumType   = 'SHA256'
    checksum64     = '068d8895c422b1063813a66074ff52be1f1e8464f3dca51ba5d8b66f36c8357a'
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
