$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://app-pc.kakaocdn.net/talk/win32/KakaoTalk_Setup.exe'
    checksum 	  = 'aea5e25b389683990c3745c2e909f1c281f3334cb2b222f8ea31943191659f42'
    checksumType  = 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '/S'
    validExitCodes = @(0)
}

Stop-Process -ProcessName "KakaoTalk*" -ErrorAction SilentlyContinue -Force
Install-ChocolateyPackage @packageArgs
