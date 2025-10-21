$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://app-pc.kakaocdn.net/talk/win32/KakaoTalk_Setup.exe'
    checksum 	  = '1ff27c905e35bd658beecf374301e23de7cfece3690036002e3ce93e67f578f7'
    checksumType  = 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '/S'
    validExitCodes = @(0)
}

Stop-Process -ProcessName "KakaoTalk*" -ErrorAction SilentlyContinue -Force
Install-ChocolateyPackage @packageArgs
