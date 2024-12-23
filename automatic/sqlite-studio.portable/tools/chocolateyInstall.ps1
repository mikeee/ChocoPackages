$ErrorActionPreference = 'Stop'

$toolsDir   = Join-Path -Path (Get-ToolsLocation) -ChildPath 'sqlite-studio.portable'
#"$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://github.com/pawelsalawa/sqlitestudio/releases/download/3.4.12/sqlitestudio_i386-3.4.12.zip'
    url64          = 'https://github.com/pawelsalawa/sqlitestudio/releases/download/3.4.12/sqlitestudio_x64-3.4.12.zip'
    checksum       = 'b8d348b5f519def8ea1d9660ac94706660bdef5f6d29704bda1a1d400bf72e03'
    checksumType   = 'SHA256'
    checksum64     = '8ca43d1cffd5945d506926f9ee3bfa3eee40a0102b20a5ad38307a109cc1b58f'
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
