$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://app-pc.kakaocdn.net/talk/win32/KakaoTalk_Setup.exe'
    checksum 	  = '9b38316b0b8f31697c9cd651544e50a0834efc62a4e4ffebd417fe9149eaf3fa'
    checksumType  = 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '/S'
    validExitCodes = @(0)
}

Stop-Process -ProcessName "KakaoTalk*" -ErrorAction SilentlyContinue -Force
Install-ChocolateyPackage @packageArgs
