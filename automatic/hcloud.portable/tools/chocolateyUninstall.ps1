  
$ErrorActionPreference = 'Stop';

$hcloudExe = Get-ChildItem $(Split-Path -Parent $MyInvocation.MyCommand.Definition) | Where-Object -Property Name -Match "hcloud.exe"

if (-Not($hcloudExe)) 
{
    Write-Error -Message "hcloud exe is not found, please contact the maintainer of the package" -Category ResourceUnavailable
}

Write-Host "found hcloud exe in $($hcloudExe.FullName)"
Write-Host "attempting to remove it" 

Remove-Item $hcloudExe.FullName