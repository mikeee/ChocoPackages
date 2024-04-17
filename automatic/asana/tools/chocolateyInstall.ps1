$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName     = $env:ChocolateyPackageName
    url             = 'https://desktop-downloads.asana.com/win32_ia32/prod/latest/AsanaSetup.exe'
    checksum        = 'ed4bb9a5460d1e6c4455886331d49340e55f557c8272c8d9bb077e57920cfabb'
    checksumType    = 'SHA256'
    url64           = 'https://desktop-downloads.asana.com/win32_x64/prod/latest/AsanaSetup.exe'
    checksum64      = '55faeb56671ab09365414ffe2678d3cb2a46319ab2e98af61ade5060fd229035'
    checksumType64  = 'SHA256'
    fileType        = 'EXE'
    silentArgs      = '--silent'
    validExitCodes  = @(0)
}

Install-ChocolateyPackage @packageArgs
