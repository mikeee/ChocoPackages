$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.60.2/winmerge-2.16.60.2-exe.zip'
    url64          = 'https://github.com//WinMerge/winmerge/releases/download/v2.16.60.2/winmerge-2.16.60.2-x64-exe.zip'

    checksum       = '926086492b708991a5404dd3348771839073611ec6e1c63466483e28a60feb2e'
    checksumType   = 'SHA256'
    checksum64     = 'efffb5e08fa0e4fa8035ea57dac811a2d23927063baa6e63998fa8b621b27934'
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
