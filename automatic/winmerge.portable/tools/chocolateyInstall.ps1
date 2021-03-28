$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.11/winmerge-2.16.11-exe.zip'
    url64          = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.11/winmerge-2.16.11-x64-exe.zip'

    checksum       = 'd4bd9357340fb4d93de37e8e0bbc7a06c742429e58753c03c52c8ff4ba9305b6'
    checksumType   = 'SHA256'
    checksum64     = '872d9f829e501b35d79244e8bd3a0d65400eded020e5b8f511e468ed742a07b3'
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
