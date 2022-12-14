$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://downloads.sparkmailapp.com/Spark3/win/dist/3.2.1.40643/Spark.exe'
    checksum 	  = '634982a7fe07bb496fd672329e344a7d110aa40c9d4824318a90e9ac7a136044'
    checksumType  = 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '/S'
    validExitCodes = @(0)
}

Stop-Process -ProcessName "Spark Desktop*" -ErrorAction SilentlyContinue -Force
Install-ChocolateyPackage @packageArgs
