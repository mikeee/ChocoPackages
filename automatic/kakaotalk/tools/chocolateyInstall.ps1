$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://lk.kakaocdn.net/talkpc/talk/win32/KakaoTalk_Setup.exe?version=26.8.0.5312'
    checksum 	  = '1f744bf020843e0c172bb2bf4d123e622072cc675a793ae448b8ecc762e153f8'
    checksumType  = 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '/S'
    validExitCodes = @(0)
}

Stop-Process -ProcessName "KakaoTalk*" -ErrorAction SilentlyContinue -Force
Install-ChocolateyPackage @packageArgs
