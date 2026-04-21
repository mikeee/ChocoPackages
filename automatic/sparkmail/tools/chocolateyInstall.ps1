$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = 'https://downloads.sparkmailapp.com/Spark3/win/dist/3.28.6.138292/Spark.exe'
    checksum 	  = 'fa6e8959c63fa9675d0b6bbc23c560ad24ac49699f624ded32f47c2219e3a959'
    checksumType  = 'SHA256'
    fileType      = 'EXE'
    silentArgs    = '/S'
    validExitCodes = @(0)
}

Stop-Process -ProcessName "Spark Desktop*" -ErrorAction SilentlyContinue -Force
Install-ChocolateyPackage @packageArgs
