$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName     = $env:ChocolateyPackageName
    url             = 'https://desktop-downloads.asana.com/win32_ia32/prod/latest/AsanaSetup.exe'
    checksum        = 'e06ffd08f16dba2c938135e5228d85da9a6149fe30962f0361cbba6f00f871dc'
    checksumType    = 'SHA256'
    url64           = 'https://desktop-downloads.asana.com/win32_x64/prod/latest/AsanaSetup.exe'
    checksum64      = 'e9eaf38b43a0060a71fc5025780d3817c0f6905b7233a6dd2216e79889bca1e4'
    checksumType64  = 'SHA256'
    fileType        = 'EXE'
    silentArgs      = '--silent'
    validExitCodes  = @(0)
}

Install-ChocolateyPackage @packageArgs
