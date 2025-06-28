$ErrorActionPreference = 'Stop'

$toolsDir   = Join-Path -Path (Get-ToolsLocation) -ChildPath 'endless-sky'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url64          = 'https://github.com/endless-sky/endless-sky/releases/download/v0.10.14/EndlessSky-win64-v0.10.14.zip'
    checksum64     = '20a976903da687865d2fb91a00c9f6a7e47faea8d49a04d1687e875092fa6e41'
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
