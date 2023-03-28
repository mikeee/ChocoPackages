$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$installDir = Join-Path -Path (Get-ToolsLocation) -ChildPath $env:ChocolateyPackageName

$packageArgs = @{
    packageName  = $env:ChocolateyPackageName
    fileFullPath = Join-Path -Path $toolsDir -ChildPath 'crystaldiskmark.zip'
    destination  = $installDir
}

Get-ChocolateyUnzip @packageArgs

$osArch = (Get-WmiObject win32_operatingsystem | select osarchitecture).osarchitecture
if ($osArch -eq "*ARM 64-bit*"){ #ARM 64bit
    $exePath = 'DiskMarkA64.exe'
}
elseif ($osArch -eq "*64-bit*") { #64bit
    $exePath = 'DiskMark64.exe'
}
elseif ($osArch -eq "*ARM*") { #ARM 32bit
    $exePath = 'DiskMarkA32.exe'
}
else { #32bit
    $exePath = 'DiskMark32.exe'
}

Install-BinFile -Name 'CrystalDiskMark' -Path (Join-Path -Path $installDir -ChildPath $exePath)

# Start menu shortcuts
$progsFolder = [Environment]::GetFolderPath('Programs')
If ( Test-ProcessAdminRights ) {
    $progsFolder = [Environment]::GetFolderPath('CommonPrograms')
}

Install-ChocolateyShortcut -shortcutFilePath (Join-Path -Path $progsFolder -ChildPath 'CrystalDiskMark.lnk') `
    -targetPath (Join-Path -Path $installDir -ChildPath "$exePath")