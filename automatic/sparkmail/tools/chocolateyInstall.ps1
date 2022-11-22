$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://downloads.sparkmailapp.com/Spark3/win/dist/3.1.2.39231/Spark.exe'
    checksum 	  = 'c9b865f16cc1df1f4d38a3e86d87d5bb954d33b6e7aed72f7abf51313a82810b'
    checksumType  = 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '/S'
    validExitCodes = @(0)
}

Stop-Process -ProcessName "Spark Desktop*" -ErrorAction SilentlyContinue -Force
Install-ChocolateyPackage @packageArgs
