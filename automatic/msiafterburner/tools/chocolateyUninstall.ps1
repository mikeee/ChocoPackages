$ErrorActionPreference = 'Stop';

$packageName = $env:ChocolateyPackageName
$software = @('MSI Afterburner*', 'RivaTuner Statistics Server*')
$silentArgs = '/S'
$scriptPath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$ahkFile = Join-Path $scriptPath 'chocolateyUninstall.ahk'
$ahkExe = 'AutoHotKey'
$ahkRun = "$Env:Temp\$(Get-Random).ahk"

Copy-Item $ahkFile "$ahkRun" -Force
Start-Process $ahkExe $ahkRun

For($i=0; $i -lt $software.Length; $i++) {
  [array]$key = Get-UninstallRegistryKey -SoftwareName $software[$i]

  if ($key.Count -eq 1) {
    $key | ForEach-Object {
      $file = $($_.UninstallString)
      Start-Process $file -ArgumentList $silentArgs -Verb RunAs
    }
  } elseif ($key.Count -eq 0) {
    Write-Warning "$packageName has already been uninstalled by other means."
  } elseif ($key.Count -gt 1) {
    Write-Warning "$key.Count matches found!"
    Write-Warning "To prevent accidental data loss, no programs will be uninstalled."
    Write-Warning "Please alert package maintainer(s) the following keys were matched:"
    $key | ForEach-Object {Write-Warning "- $_.DisplayName"}
  }
}

Remove-Item "$ahkRun" -Force

Remove-Item "$env:PUBLIC\Desktop\RTSS.lnk" -Force
