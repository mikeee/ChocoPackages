
$ErrorActionPreference = 'Stop';

$civoExe = Get-ChildItem $(Split-Path -Parent $MyInvocation.MyCommand.Definition) | Where-Object -Property Name -Match "civo.exe"

if (-Not($civoExe))
{
    Write-Error -Message "civo exe is not found, please contact the maintainer of the package" -Category ResourceUnavailable
}

Write-Host "found civo exe in $($civoExe.FullName)"
Write-Host "attempting to remove it"

Remove-Item $civoExe.FullName