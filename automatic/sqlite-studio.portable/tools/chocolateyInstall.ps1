$ErrorActionPreference = 'Stop'

$toolsDir   = Join-Path -Path (Get-ToolsLocation) -ChildPath 'sqlite-studio.portable'
#"$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://github.com/pawelsalawa/sqlitestudio/releases/download/3.4.1/sqlitestudio_i386-3.4.1.zip'
    url64          = 'https://github.com/pawelsalawa/sqlitestudio/releases/download/3.4.1/sqlitestudio_x64-3.4.1.zip'
    checksum       = '4dc8662bf7aadfa47181cbf633601340dff7ac261310b543f27d69b4a5841da2'
    checksumType   = 'SHA256'
    checksum64     = 'cbb7481f072afa5cfbbc2c9dcded0fef347a0c18bf6257a311f876c2fa35b006'
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
