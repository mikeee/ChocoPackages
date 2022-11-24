$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://download.bleepingcomputer.com/sUBs/ComboFix.exe'
    checksum      = '23ea3c510c9b0d48047a4b236a82a7fdbed3bd58c1b3eecf82729ef1c849d421'
    checksumType  = 'SHA256'

    unzipLocation  = $toolsdir
}

$IsWin10=[Environment]::OSVersion.Version.Major
if ($IsWin10 -eq "10") {
    Write-Error "This package is not compatible with Windows 10."
    throw
}


switch ([Environment]::OSVersion.Version.Major) {
    "6" {
        if ([Environment]::OSVersion.Version.Minor -eq "3") {
            Write-Error "This package is not compatible with Win8.1/Win2012Server R2."
            throw
        }
    }
    "10" {
        Write-Warning "This package is not compatible with Windows 10."
        throw
    } default {
        Install-ChocolateyZipPackage @packageArgs
    }
}


