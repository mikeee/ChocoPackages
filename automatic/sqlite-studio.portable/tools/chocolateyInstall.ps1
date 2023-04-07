$ErrorActionPreference = 'Stop'

$toolsDir   = Join-Path -Path (Get-ToolsLocation) -ChildPath 'sqlite-studio.portable'
#"$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://github.com/pawelsalawa/sqlitestudio/releases/download/3.4.4/sqlitestudio_i386-3.4.4.zip'
    url64          = 'https://github.com/pawelsalawa/sqlitestudio/releases/download/3.4.4/sqlitestudio_x64-3.4.4.zip'
    checksum       = '1cc779d6eb41952131eba63e9d221454daf9e582e864ec64f32175bd2f3156d1'
    checksumType   = 'SHA256'
    checksum64     = '1836c8c1f32d879098fcbda4d11391f91407b4b9fa8a3a799b61ec5b582b6425'
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
