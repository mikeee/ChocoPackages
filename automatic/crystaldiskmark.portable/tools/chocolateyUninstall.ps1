$ErrorActionPreference = 'Stop'

Uninstall-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -ZipFileName 'crystaldiskmark.zip'
Uninstall-BinFile -Name 'CrystalDiskMark'