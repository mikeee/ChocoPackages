$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.28/winmerge-2.16.28-exe.zip'
    url64          = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.28/winmerge-2.16.28-x64-exe.zip'

    checksum       = '5df7528f94432360b5c7a05f5a0a605344c18acf94f22d7c8d5506f07220c133'
    checksumType   = 'SHA256'
    checksum64     = 'e1c6dca744b2022dc0f3a105164d29f151373fa067411e579e6e005ba7a98b8b'
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
