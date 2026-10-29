$package = 'AdobeAIR'

$params = @{
    packageName  = $package;
    fileType     = 'exe';
    silentArgs   = '-silent -eulaAccepted';
    url          = 'https://airsdk.wxlift.com/assets/downloads/51.4.1.2/AdobeAIR.exe'
    checksum     = 'aae4f1b86c1a6323bdece032bb51daa27a872361c2494e6489571a411af9b597'
    checksumType = 'SHA256'
}

Install-ChocolateyPackage @params
