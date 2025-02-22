$ErrorActionPreference = 'Stop'

$toolsDir   = Join-Path -Path (Get-ToolsLocation) -ChildPath 'endless-sky'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url64          = 'https://github.com/endless-sky/endless-sky/releases/download/v0.10.12/EndlessSky-win64-v0.10.12.zip'
    checksum64     = 'de70d21050615685f715e1ccf7832098e1da1594ffd73634165444b0ce2929f3'
    checksumType64 = 'SHA256'

    unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
Install-BinFile -Name 'EndlessSky' -Path (Join-Path -Path $toolsdir -ChildPath 'EndlessSky.exe')

# Start menu shortcuts
$progsFolder = [Environment]::GetFolderPath('Programs')
If ( Test-ProcessAdminRights ) {
    $progsFolder = [Environment]::GetFolderPath('CommonPrograms')
}

Install-ChocolateyShortcut -shortcutFilePath (Join-Path -Path $progsFolder -ChildPath 'EndlessSky.lnk') `
    -targetPath (Join-Path -Path $toolsDir -ChildPath "./endless-sky/EndlessSky.exe")
