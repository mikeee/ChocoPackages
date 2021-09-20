$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.15/winmerge-2.16.15-exe.zip'
    url64          = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.15/winmerge-2.16.15-x64-exe.zip'

    checksum       = 'c77d02497d8fc4d1d673a47967421187a5bcbc33a461906cc019d32a62bf476c'
    checksumType   = 'SHA256'
    checksum64     = '3156874a90fb249ff40292f102c050ebaf4f2dd1f229e38eb9ce5fdb57a69524'
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
