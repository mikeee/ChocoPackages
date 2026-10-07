$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://lk.kakaocdn.net/talkpc/talk/win32/KakaoTalk_Setup.exe?version=26.8.2.5324'
    checksum 	  = 'f3b21b92dbe17f13e8606a91df2e2e32ef4ffd4054b007242e6be32e45bf7e2c'
    checksumType  = 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '/S'
    validExitCodes = @(0)
}

Stop-Process -ProcessName "KakaoTalk*" -ErrorAction SilentlyContinue -Force
Install-ChocolateyPackage @packageArgs
