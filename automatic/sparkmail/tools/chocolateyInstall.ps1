$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = ''
    checksum 	  = ''
    checksumType  = ''
    fileType      = 'EXE'
    silentArgs    = '/S'
    validExitCodes = @(0)
}

Stop-Process -ProcessName "Spark Desktop*" -ErrorAction SilentlyContinue -Force
Install-ChocolateyPackage @packageArgs
