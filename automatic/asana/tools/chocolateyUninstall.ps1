$ErrorActionPreference = 'Stop';

$packageName = $env:ChocolateyPackageName
$softwareName = 'Asana*'
$installerType = 'exe'
$silentArgs = '--uninstall --silent'
$validExitCodes = @(0)

[array]$key = Get-UninstallRegistryKey -SoftwareName $softwareName

if ($key.Count -eq 1) {
  $key | ForEach-Object {
    $file = "$($_.InstallLocation)\Update.exe"

    if ($installerType -eq 'MSI') {
      $silentArgs = "$($_.PSChildName) $silentArgs"
      $file = ''
    }

    Uninstall-ChocolateyPackage -PackageName $packageName `
                                -FileType $installerType `
                                -SilentArgs "$silentArgs" `
                                -ValidExitCodes $validExitCodes `
                                -File "$file"
  }
} elseif ($key.Count -eq 0) {
  Write-Warning "$packageName has already been uninstalled by other means."
} elseif ($key.Count -gt 1) {
  Write-Warning "$key.Count matches found!"
  Write-Warning "To prevent accidental data loss, no programs will be uninstalled."
  Write-Warning "Please alert package maintainer(s) the following keys were matched:"
  $key | ForEach-Object {Write-Warning "- $_.DisplayName"}
}