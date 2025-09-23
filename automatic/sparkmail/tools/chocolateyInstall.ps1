$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://downloads.sparkmailapp.com/Spark3/win/dist/3.26.0.117234/Spark.exe'
    checksum 	  = 'a610e0b46f6f13ad718ac639e6ba804aadb959e52cecec4717ac3cff78f19b17'
    checksumType  = 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '/S'
    validExitCodes = @(0)
}

Stop-Process -ProcessName "Spark Desktop*" -ErrorAction SilentlyContinue -Force
Install-ChocolateyPackage @packageArgs
