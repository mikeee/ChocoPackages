$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.54/winmerge-2.16.54-exe.zip'
    url64          = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.54/winmerge-2.16.54-x64-exe.zip'

    checksum       = '3d079061e43af4adf2a4b4aa271836fb4801c4ef017ad691d075c5ad244e2b56'
    checksumType   = 'SHA256'
    checksum64     = '08d09f3832cb15dd2298dd674531d5049d9345331a73c5be1fb2181395a0a6be'
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
