$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.14/winmerge-2.16.14-exe.zip'
    url64          = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.14/winmerge-2.16.14-x64-exe.zip'

    checksum       = '7c4bfaa7a632ce4d7290a1e9957544cff0e2a141644f64d8c12391f4ae1afb84'
    checksumType   = 'SHA256'
    checksum64     = '9e803a5a2c11fd3e2b63b3616d0da071b456b5759ad7f5b9b9ea1b84ca9c5e70'
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
