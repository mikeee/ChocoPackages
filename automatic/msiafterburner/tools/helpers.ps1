function Stop-Afterburner() {
  $waitseconds = 2
  foreach ($procstring in @("MSIAfterburner*", "RTSS*", "EncoderServer*")) {
  #  Write-Output "Checking whether process matching $procstring is running..."
    for ($i = 1; $i -le 2; $i++) {
      $procobj = Get-Process $procstring -ErrorAction SilentlyContinue
      if ($null -eq $procobj) {
        # Write-Output " SUCCESS - No process matching $procstring is running"
        break
      }
      Write-Output "Attempting to stop running process $procstring..."
      Stop-Process -Name $procstring
      # Write-Output " Try # $i : Waiting $waitseconds seconds for process to terminate..."
      Start-Sleep -s $waitseconds
    }
  }
}