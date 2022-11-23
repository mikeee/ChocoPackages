$ErrorActionPreference = 'Stop'

$toolsDir   = Join-Path -Path (Get-ToolsLocation) -ChildPath 'endless-sky'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://github.com/endless-sky/endless-sky/releases/download/v0.9.16.1/endless-sky-win32-v0.9.16.1.zip'
    url64          = 'https://github.com/endless-sky/endless-sky/releases/download/v0.9.16.1/endless-sky-win64-v0.9.16.1.zip'
    checksum       = '1e86749b2babc3bd45fc888c5c7bbc0f9564cf9a18404eb22e98b02564361cd3'
    checksumType   = 'SHA256'
    checksum64     = 'ec680f41cd5133e44d06127ee170378671a6387c4b180966da2126e4a3e360f6'
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
