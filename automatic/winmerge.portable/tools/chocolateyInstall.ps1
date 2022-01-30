$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.18/winmerge-2.16.18-exe.zip'
    url64          = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.18/winmerge-2.16.18-x64-exe.zip'

    checksum       = 'd628ded6b759bc91ba46ce96e6e84a3a94b0b19703c75672022dce44996dd3d1'
    checksumType   = 'SHA256'
    checksum64     = 'bd8c75062493cfce6cd73e16fd0c5ba55b18a50ee6cfeb17cce3c142ecbfa05f'
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
