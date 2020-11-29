$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//WinMerge/winmerge/releases/download/2.16.9/winmerge-2.16.9-exe.zip'
    url64          = 'https://github.com//WinMerge/winmerge/releases/download/2.16.9/winmerge-2.16.9-x64-exe.zip'

    checksum       = 'e8437b4c35befe115da323be8a5ec9590ade655513b632d33ea4471564023a5e'
    checksumType   = 'SHA256'
    checksum64     = '086097916168d1b06e889747f9483995bb3da2d4f4970c80dd8b30f3bc37face'
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
