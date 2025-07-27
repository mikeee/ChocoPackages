$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.50/winmerge-2.16.50-exe.zip'
    url64          = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.50/winmerge-2.16.50-x64-exe.zip'

    checksum       = 'e4f4a60ae6b458bc1817ee92705f4a19a4d2ca9d49c88dbeaa21e29d3cd5b460'
    checksumType   = 'SHA256'
    checksum64     = 'e2b6b13a9936f2e0f0d457944a333f7148cb26da2f859a110ab7dd9d13a2d5b0'
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
