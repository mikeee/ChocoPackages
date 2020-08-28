$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//WinMerge/winmerge/releases/download/2.16.8/winmerge-2.16.8-exe.zip'
    url64          = 'https://github.com//WinMerge/winmerge/releases/download/2.16.8/winmerge-2.16.8-x64-exe.zip'

    checksum       = '8cb808ba2f038d0632915e169bc9677d58f3811e7c935044144a0b34f0a335b4'
    checksumType   = 'SHA256'
    checksum64     = 'ad3f07f9e11b5cbb8fcf3fda5cb4a5ea6f01ff0e7635709bf3228fe806e8ba7d'
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
