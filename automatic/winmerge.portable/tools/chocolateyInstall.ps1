$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.48/winmerge-2.16.48-exe.zip'
    url64          = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.48/winmerge-2.16.48-x64-exe.zip'

    checksum       = '2ec8cfb3e254d278bc55963a67e6f4e606b7d1c869629513db8b337c2700269c'
    checksumType   = 'SHA256'
    checksum64     = 'cb377436b79c28af5fcc43730dcb3e5c5b521a01b6d01f8fa166d51e861766b2'
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
