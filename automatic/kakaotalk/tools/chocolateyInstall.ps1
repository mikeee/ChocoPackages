$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://app-pc.kakaocdn.net/talk/win32/KakaoTalk_Setup.exe'
    checksum 	  = 'c06fa46c9f332ebf04180939bdef39b9296d06981416f206c9b6bb60aad3ca00'
    checksumType  = 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '/S'
    validExitCodes = @(0)
}

Stop-Process -ProcessName "KakaoTalk*" -ErrorAction SilentlyContinue -Force
Install-ChocolateyPackage @packageArgs
