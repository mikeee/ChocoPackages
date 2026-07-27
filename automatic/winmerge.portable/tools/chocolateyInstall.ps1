$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.58/winmerge-2.16.58-exe.zip'
    url64          = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.58/winmerge-2.16.58-x64-exe.zip'

    checksum       = 'c92d5dd01d04dc4ac7b6a062e193be1df69dd357217dc2a037ffa2bd201bc13d'
    checksumType   = 'SHA256'
    checksum64     = '58a0e36abc99b0da539d3b33b1df8a494239d53900f1ab57c305853df5da94a6'
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
