$ErrorActionPreference = 'Stop';
 
$packageArgs = @{
  packageName     = $env:ChocolateyPackageName
  fileType        = 'exe'
  silentargs      = '/S'
  validExitCodes  = @(0)
  file            = 'C:\Program Files (x86)\Kakao\KakaoTalk\uninstall.exe'

}

UnInstall-ChocolateyPackage @packageArgs