$ErrorActionPreference = 'Stop';

$packageName = $env:ChocolateyPackageName
$softwareName = 'Adobe AIR*'
$installerType = 'MSI'

[array]$key = Get-UninstallRegistryKey -SoftwareName $softwareName

if ($key.Count -eq 1) {
  $key | ForEach-Object {
    $silentArgs = "/x $($_.PSChildName) /qb-! REBOOT=ReallySuppress"

    Uninstall-ChocolateyPackage -PackageName $packageName `
                                -FileType $installerType `
                                -SilentArgs "$silentArgs" `
  }
} elseif ($key.Count -eq 0) {
  Write-Warning "$packageName has already been uninstalled by other means."
} elseif ($key.Count -gt 1) {
  Write-Warning "$key.Count matches found!"
  Write-Warning "To prevent accidental data loss, no programs will be uninstalled."
  Write-Warning "Please alert package maintainer(s) the following keys were matched:"
  $key | ForEach-Object {Write-Warning "- $_.DisplayName"}
}
