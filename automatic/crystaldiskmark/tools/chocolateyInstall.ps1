$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $toolsDir
    url            = 'https://osdn.net/frs/redir.php?m=dotsrc&f=crystaldiskmark/71859/CrystalDiskMark7_0_0h.exe'
    checksum       = '6b908d70ee1ac865a96f8fbee3c7b9f960d357cd5c02a43dac082f498c99514b'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
    validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
