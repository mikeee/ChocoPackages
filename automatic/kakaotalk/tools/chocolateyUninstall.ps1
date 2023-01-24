$ErrorActionPreference = 'Stop';

$packageName = $env:ChocolateyPackageName
$softwareName = 'KakaoTalk*'
$installerType = 'exe'
$silentArgs = '/S'

$uninstalled = $false

[array]$key = Get-UninstallRegistryKey -SoftwareName $softwareName

if ($key.Count -eq 1) {
  $key | ForEach-Object {
    $file = $($_.UninstallString)

    if ($installerType -eq 'MSI') {
      $silentArgs = "$($_.PSChildName) $silentArgs"
      $file = ''
    }

    & $file $silentargs

    $wshell = New-Object -ComObject WScript.Shell

    while ($wshell.AppActivate("KakaoTalk Uninstall") -eq $false) {
      Start-Sleep -Seconds 1
    }
    $wshell.SendKeys("{ENTER}")
  }
} elseif ($key.Count -eq 0) {
  Write-Warning "$packageName has already been uninstalled by other means."
} elseif ($key.Count -gt 1) {
  Write-Warning "$key.Count matches found!"
  Write-Warning "To prevent accidental data loss, no programs will be uninstalled."
  Write-Warning "Please alert package maintainer(s) the following keys were matched:"
  $key | ForEach-Object {Write-Warning "- $_.DisplayName"}
}