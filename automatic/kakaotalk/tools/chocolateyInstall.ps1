$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://lk.kakaocdn.net/talkpc/talk/win32/KakaoTalk_Setup.exe?version=26.10.0.5364'
    checksum 	  = '2acbc6e0c676cb215b16e6e6ccd7630f333e65229cfc892c13528e919815027f'
    checksumType  = 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '/S'
    validExitCodes = @(0)
}

Stop-Process -ProcessName "KakaoTalk*" -ErrorAction SilentlyContinue -Force
Install-ChocolateyPackage @packageArgs
