$ErrorActionPreference = 'Stop'

$installDir = Join-Path -Path (Get-ToolsLocation) -ChildPath $env:ChocolateyPackageName
$toolsDir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
$pkgPath = Split-Path -Path $toolsdir -Parent

[Environment]::GetFolderPath('Programs'), [Environment]::GetFolderPath('CommonPrograms') | ForEach-Object {
    Remove-Item -Path (Join-Path -Path $_ -ChildPath 'EndlessSky.lnk') -ErrorAction SilentlyContinue
}

# Remove the shim
Uninstall-BinFile -Name 'EndlessSky'

# Remove the install
# get the name of the file created by Install-ChocolateyZipPackage
$zipFilename = (Get-Item -Path (Join-Path -Path $pkgPath -ChildPath '*.zip.txt') | Select-Object -First 1).Basename
Uninstall-ChocolateyZipPackage -PackageName 'endless-sky' -ZipFileName $zipFilename

# Cleanup any misc files
Remove-Item -Path $installDir -Recurse -Force