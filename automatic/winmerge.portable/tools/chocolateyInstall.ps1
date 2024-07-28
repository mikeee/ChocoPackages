$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.42.1/winmerge-2.16.42.1-exe.zip'
    url64          = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.42.1/winmerge-2.16.42.1-x64-exe.zip'

    checksum       = 'a565504d1197a81f7e187d9b9b8a789357b5249084ea8a0895455891137442a5'
    checksumType   = 'SHA256'
    checksum64     = '4051c4ba9c87cba7b82a4f708e242dc608a9ec1889782f015e7b39b42758100b'
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
