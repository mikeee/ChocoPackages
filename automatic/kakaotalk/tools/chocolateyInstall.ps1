$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://app-pc.kakaocdn.net/talk/win32/KakaoTalk_Setup.exe'
    checksum 	  = 'dd75792d82adc3a83e3b8eba821d5e1d73a7189fc39a873501ab03427449f4c7'
    checksumType  = 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '/S'
    validExitCodes = @(0)
}

Stop-Process -ProcessName "KakaoTalk*" -ErrorAction SilentlyContinue -Force
Install-ChocolateyPackage @packageArgs
