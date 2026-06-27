$ErrorActionPreference = 'Stop'

$toolsDir   = Join-Path -Path (Get-ToolsLocation) -ChildPath 'endless-sky'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url64          = 'https://github.com/endless-sky/endless-sky/releases/download/v0.11.2/EndlessSky-win64-v0.11.2.zip'
    checksum64     = '28c7069175923b345308b1bc74b1a853b5bdc9e125888f6d38f33fc2c500a4f7'
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
