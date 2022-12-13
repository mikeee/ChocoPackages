$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    url            = 'https://download.amd.com/Desktop/AMD-Ryzen-Master.exe'
    checksum       = '7A6E09BF9C81AE5ED26FAE6888ED0D41F9DCA20648E0B04F4D7C6BD99EB60506'
    checksumType   = 'SHA256'
    fileType       = 'EXE'
    silentArgs     = '/S /v/qn'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
