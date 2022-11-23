$ErrorActionPreference = 'Stop';

$silentargs          = '/S'
$uninstaller32       = "${Env:ProgramFiles(x86)}\Kakao\KakaoTalk\uninstall.exe"
$uninstaller64       = "${Env:ProgramFiles}\Kakao\KakaoTalk\uninstall.exe"

if (Test-Path "$uninstaller64") {$file = "$uninstaller64"}
if (Test-Path "$uninstaller32") {$file = "$uninstaller32"}

if ((Test-Path "$uninstaller64") -or (Test-Path "$uninstaller32")) {
  & $file $silentargs

  $wshell = New-Object -ComObject WScript.Shell

  while ($wshell.AppActivate("KakaoTalk Uninstall")) {
    Start-Sleep -Seconds 1
  }
  $wshell.SendKeys("{ENTER}")
}