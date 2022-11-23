$ErrorActionPreference = 'Stop';

$silentargs          = '/S'
$uninstaller32       = "${Env:ProgramFiles(x86)}\Kakao\KakaoTalk\uninstall.exe"
$uninstaller64       = "${Env:ProgramFiles}\Kakao\KakaoTalk\uninstall.exe"
$file                = ""

if (Test-Path "$uninstaller64") {
  $file = "$uninstaller64"
} 
else if (Test-Path "$uninstaller32") {
  $file = "$uninstaller32"
}

if ($file -ne "") {
  & $file $silentargs

  $wshell = New-Object -ComObject WScript.Shell

  while ($wshell.AppActivate("KakaoTalk Uninstall") -eq $false) {
    Start-Sleep -Seconds 1
  }
  $wshell.SendKeys("{ENTER}")
}