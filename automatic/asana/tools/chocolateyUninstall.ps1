$packageArgs = @{
  packageName     = $env:ChocolateyPackageName
  fileType        = 'exe'
  silentargs      = '--uninstall --silent'
  validExitCodes  = @(0)
  file            = "$env:LOCALAPPDATA\Asana\Update.exe"

}

UnInstall-ChocolateyPackage @packageArgs