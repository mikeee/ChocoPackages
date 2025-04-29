$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.48.2/winmerge-2.16.48.2-exe.zip'
    url64          = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.48.2/winmerge-2.16.48.2-x64-exe.zip'

    checksum       = '5381cd226c3640c8244e2f2ede8ab12dbd79de135a1e474909ffdbc40dcc1962'
    checksumType   = 'SHA256'
    checksum64     = '1c87bae8cf1af3612a905fd6ceb86a02ce25f8acc44a21b8356b26e9f8567ef2'
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
