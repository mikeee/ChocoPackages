$ErrorActionPreference = 'Stop'

$toolsDir   = Join-Path -Path (Get-ToolsLocation) -ChildPath 'letos.portable'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url64          = 'https://github.com/pawelsalawa/sqlitestudio/releases/download/4.0.4/letos-4.0.4-windows-x64.zip'
    checksum64     = 'f50cb9605baa7f369017d02a3adbfe70cd4aecf6272fbf766cda261854a8b074'
    checksumType64 = 'SHA256'

    unzipLocation  = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs
Install-BinFile -Name 'letos' -Path (Join-Path -Path $toolsDir -ChildPath './Letos/letos.exe')

# Start menu shortcuts
$progsFolder = [Environment]::GetFolderPath('Programs')
If ( Test-ProcessAdminRights ) {
    $progsFolder = [Environment]::GetFolderPath('CommonPrograms')
}

Install-ChocolateyShortcut -shortcutFilePath (Join-Path -Path $progsFolder -ChildPath 'Letos Portable.lnk') `
    -targetPath (Join-Path -Path $toolsDir -ChildPath './Letos/letos.exe')
