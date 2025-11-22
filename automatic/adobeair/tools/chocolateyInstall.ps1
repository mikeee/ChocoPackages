$package = 'AdobeAIR'

$params = @{
    packageName  = $package;
    fileType     = 'exe';
    silentArgs   = '-silent -eulaAccepted';
    url          = 'https://airsdk.harman.com/assets/downloads/51.2.2.6/AdobeAIR.exe'
    checksum     = 'f8e492e0ecf42fc395b337513d5589798a5b77b2054627831693f2b7613d946e'
    checksumType = 'SHA256'
}

Install-ChocolateyPackage @params
