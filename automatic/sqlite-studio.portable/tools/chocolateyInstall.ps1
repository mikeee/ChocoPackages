$ErrorActionPreference = 'Stop'

$toolsDir   = Join-Path -Path (Get-ToolsLocation) -ChildPath 'sqlite-studio.portable'
#"$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://github.com/pawelsalawa/sqlitestudio/releases/download/3.4.13/sqlitestudio_i386-3.4.13.zip'
    url64          = 'https://github.com/pawelsalawa/sqlitestudio/releases/download/3.4.13/sqlitestudio_x64-3.4.13.zip'
    checksum       = 'baf180a968ade04a404d410592e0039cbec50fe606f5e0fca51c22a9fab76073'
    checksumType   = 'SHA256'
    checksum64     = 'd11e8530fa15d0523675f437cdcd1b37e56b34e7a69dc7caa86875f3392d4309'
    checksumType64 = 'SHA256'

    unzipLocation  = $toolsDir
}

# Some of this was taken from https://github.com/brianmego/Chocolatey/pull/6
Install-ChocolateyZipPackage @packageArgs
Install-BinFile -Name 'SQLiteStudio' -Path (Join-Path -Path $toolsdir -ChildPath './SQLiteStudio/SQLiteStudio.exe')

# Start menu shortcuts
$progsFolder = [Environment]::GetFolderPath('Programs')
If ( Test-ProcessAdminRights ) {
    $progsFolder = [Environment]::GetFolderPath('CommonPrograms')
}

Install-ChocolateyShortcut -shortcutFilePath (Join-Path -Path $progsFolder -ChildPath 'SQLiteStudio Portable.lnk') `
    -targetPath (Join-Path -Path $toolsDir -ChildPath "./SQLiteStudio/SQLiteStudio.exe")
