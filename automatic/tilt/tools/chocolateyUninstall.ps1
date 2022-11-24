$ErrorActionPreference = 'Stop';

$tiltExe = Get-ChildItem $(Split-Path -Parent $MyInvocation.MyCommand.Definition) | Where-Object -Property Name -Match "tilt.exe"

if (-Not($tiltExe))
{
    Write-Error -Message "tilt exe is not found, please contact the maintainer of the package" -Category ResourceUnavailable
}

Write-Host "found tilt exe in $($tiltExe.FullName)"
Write-Host "attempting to remove it"

Remove-Item $tiltExe.FullName