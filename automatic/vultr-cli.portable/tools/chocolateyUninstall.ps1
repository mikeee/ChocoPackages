
$ErrorActionPreference = 'Stop';

$vultrExe = Get-ChildItem $(Split-Path -Parent $MyInvocation.MyCommand.Definition) | Where-Object -Property Name -Match "vultr-cli.exe"

if (-Not($vultrExe))
{
    Write-Error -Message "vultr-cli exe is not found, please contact the maintainer of the package" -Category ResourceUnavailable
}

Write-Host "found vultr-cli exe in $($vultrExe.FullName)"
Write-Host "attempting to remove it"

Remove-Item $vultrExe.FullName