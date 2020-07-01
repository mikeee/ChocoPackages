$ErrorActionPreference = 'Stop'

$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$PortableEXE = "$toolsDir\throttlestop\ThrottleStop.exe"

Install-ChocolateyShortcut -shortcutFilePath "$ENV:Public\Desktop\ThrottleStop.lnk" -targetPath $PortableEXE
Install-ChocolateyShortcut -shortcutFilePath "$ENV:ProgramData\Microsoft\Windows\Start Menu\Programs\ThrottleStop.lnk" -targetPath $PortableEXE