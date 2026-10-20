$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://lk.kakaocdn.net/talkpc/talk/win32/KakaoTalk_Setup.exe?version=26.9.0.5337'
    checksum 	  = '5ed38b39bbca521ba66fd9f961347aeac5cba80dc96f9657e7baf99b0aec022a'
    checksumType  = 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '/S'
    validExitCodes = @(0)
}

Stop-Process -ProcessName "KakaoTalk*" -ErrorAction SilentlyContinue -Force
Install-ChocolateyPackage @packageArgs
