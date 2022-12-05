$package = 'AdobeAIR'

$params = @{
    packageName  = $package;
    fileType     = 'exe';
    silentArgs   = '-silent -eulaAccepted';
    url          = 'https://airsdk.harman.com/assets/downloads/AdobeAIR.exe'
    checksum     = 'd43321d814e744fd571f3f6360da070142c6a57afb4fe5eca0bd494c3384a38a'
    checksumType = 'SHA256'
}

Install-ChocolateyPackage @params
