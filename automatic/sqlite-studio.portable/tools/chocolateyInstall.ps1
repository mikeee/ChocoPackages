$ErrorActionPreference = 'Stop'

$toolsDir   = Join-Path -Path (Get-ToolsLocation) -ChildPath 'sqlite-studio.portable'
#"$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://github.com/pawelsalawa/sqlitestudio/releases/download/3.4.9/sqlitestudio_i386-3.4.9.zip'
    url64          = 'https://github.com/pawelsalawa/sqlitestudio/releases/download/3.4.9/sqlitestudio_x64-3.4.9.zip'
    checksum       = '0b15319c8e48cb82fd5605d7ce15eb314be5db557ca87bc2c6ec9426e98bf218'
    checksumType   = 'SHA256'
    checksum64     = '6a5f55f5c8c63ac9758ad467c18290c27cfab9a2ed0595e04f5b7c2d645b020d'
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
