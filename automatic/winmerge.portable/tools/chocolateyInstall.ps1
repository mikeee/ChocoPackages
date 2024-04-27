$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.40/winmerge-2.16.40-exe.zip'
    url64          = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.40/winmerge-2.16.40-x64-exe.zip'

    checksum       = 'd960c9749f6c74dc7f43c45328d60c7f6e376e3cb37854157e8ccc95c5445ba7'
    checksumType   = 'SHA256'
    checksum64     = '044d02b0b93c8ade880946a9afa1e476f4c9cdd740c299168b1e09878ed15337'
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
