$ErrorActionPreference = 'Stop';

$wsl2distromanagerExe = Get-ChildItem $(Split-Path -Parent $MyInvocation.MyCommand.Definition) | Where-Object -Property Name -Match "wsl2distromanager.exe"

if (-Not($tiltExe)) 
{
    Write-Error -Message "wsl2distromanager exe is not found, please contact the maintainer of the package" -Category ResourceUnavailable
}

Write-Host "found wsl2distromanager exe in $($wsl2distromanagerExe.FullName)"
Write-Host "attempting to remove it" 

Remove-Item $wsl2distromanagerExe.FullName