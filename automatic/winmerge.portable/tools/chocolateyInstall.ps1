$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.54.2/winmerge-2.16.54.2-exe.zip'
    url64          = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.54.2/winmerge-2.16.54.2-x64-exe.zip'

    checksum       = '9463237ed5c8e4a4443f48c3a58e51ac09dc6b068f432478164f3beca9f3c847'
    checksumType   = 'SHA256'
    checksum64     = '3832f9db8d4d2210c3a049a8c30aed16ea152a329ae0c1b0dbf9308adbc9fc5e'
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
