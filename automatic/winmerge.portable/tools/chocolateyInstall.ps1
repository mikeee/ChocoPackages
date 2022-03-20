$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.19/winmerge-2.16.19-exe.zip'
    url64          = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.19/winmerge-2.16.19-x64-exe.zip'

    checksum       = '2b9ef93aa55ab34fded7c19d04a5bc413d837c9e79c9a875f811359facdc2c0c'
    checksumType   = 'SHA256'
    checksum64     = '5cdb8c7ee2b6a1753c52eac92f5be3f7db45d06b4c074a36b361459009954c44'
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
