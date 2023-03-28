$ErrorActionPreference = 'Stop'

Uninstall-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -ZipFileName 'crystaldiskmark.zip'
Uninstall-BinFile -Name 'CrystalDiskMark'

[Environment]::GetFolderPath('Programs'), [Environment]::GetFolderPath('CommonPrograms') | ForEach-Object {
    Remove-Item -Path (Join-Path -Path $_ -ChildPath 'CrystalDiskMark.lnk') -ErrorAction SilentlyContinue
}