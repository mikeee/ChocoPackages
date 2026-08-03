$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://lk.kakaocdn.net/talkpc/talk/win32/KakaoTalk_Setup.exe?version=26.6.0.5208'
    checksum 	  = 'eb5d58c57b2b60379989c5514d50c495e13ba1ce711d57f5b02e54fc2561b144'
    checksumType  = 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '/S'
    validExitCodes = @(0)
}

Stop-Process -ProcessName "KakaoTalk*" -ErrorAction SilentlyContinue -Force
Install-ChocolateyPackage @packageArgs
