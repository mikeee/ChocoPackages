$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.46/winmerge-2.16.46-exe.zip'
    url64          = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.46/winmerge-2.16.46-x64-exe.zip'

    checksum       = '13757eefbcdc6cc253559d7787b71a8003c9d7ca659c5a767c28710c450fab68'
    checksumType   = 'SHA256'
    checksum64     = '0cf5ceaca5d4de1e7e3b97481d9310a71bca75c2209d07d20ba412f9bc03f44a'
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
