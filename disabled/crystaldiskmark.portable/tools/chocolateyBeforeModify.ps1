$runningProcess = Get-Process -Name "DiskMark*" -ErrorAction "SilentlyContinue"
if ($runningProcess) {
    Write-Host "Crystal Disk Mark is running. Try to close it automatically."
    & $runningProcess.Path --exit-all
}