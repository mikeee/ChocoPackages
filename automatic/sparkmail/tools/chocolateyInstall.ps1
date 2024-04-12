$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://downloads.sparkmailapp.com/Spark3/win/dist/3.15.2.71168/Spark.exe'
    checksum 	  = '3efea7d0f4720973e297e3d2090a28a1794539a7a5a7421c7437cf8fbfda8502'
    checksumType  = 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '/S'
    validExitCodes = @(0)
}

Stop-Process -ProcessName "Spark Desktop*" -ErrorAction SilentlyContinue -Force
Install-ChocolateyPackage @packageArgs
