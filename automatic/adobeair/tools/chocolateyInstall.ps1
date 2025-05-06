$package = 'AdobeAIR'

$params = @{
    packageName  = $package;
    fileType     = 'exe';
    silentArgs   = '-silent -eulaAccepted';
    url          = 'https://airsdk.harman.com/assets/downloads/51.2.1.3/AdobeAIR.exe'
    checksum     = 'e99b4c9daeae978b2c896a1670a27dd28f84bab6b825ae551019759aa6de1d7e'
    checksumType = 'SHA256'
}

Install-ChocolateyPackage @params
