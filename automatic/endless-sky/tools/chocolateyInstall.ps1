$ErrorActionPreference = 'Stop'

$toolsDir   = Join-Path -Path (Get-ToolsLocation) -ChildPath 'endless-sky'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url64          = 'https://github.com/endless-sky/endless-sky/releases/download/v0.10.10/EndlessSky-win64-v0.10.10.zip'
    checksum64     = '8c713558f04d662012ede65dee0ad1aa2e2e8f3d55e13abe2893ccf98bcc1480'
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
