$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName     = $env:ChocolateyPackageName
    url             = 'https://desktop-downloads.asana.com/win32_ia32/prod/latest/AsanaSetup.exe'
    checksum        = '47141907fee434b846c95e58421b00e205deea989de2eebe039dca0c53f37bb7'
    checksumType    = 'SHA256'
    url64           = 'https://desktop-downloads.asana.com/win32_x64/prod/latest/AsanaSetup.exe'
    checksum64      = '0cff84428860734c2eac6b6687888fa6cccaa09d5e8500b3cfdc431b8402e015'
    checksumType64  = 'SHA256'
    fileType        = 'EXE'
    silentArgs      = '--silent'
    validExitCodes  = @(0)
}

Install-ChocolateyPackage @packageArgs
