$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = ''
    checksum      = ''
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


