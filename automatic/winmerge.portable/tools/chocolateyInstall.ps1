$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.22/winmerge-2.16.22-exe.zip'
    url64          = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.22/winmerge-2.16.22-x64-exe.zip'

    checksum       = '3752325dba7f9971b07a0111c6b85d7de61d2a0726599453ee104940075893ab'
    checksumType   = 'SHA256'
    checksum64     = 'ac3e619f92ac1952c49c7e8a123c65d3c6f53f5271c0ee72ca2fcfc5ae479806'
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
