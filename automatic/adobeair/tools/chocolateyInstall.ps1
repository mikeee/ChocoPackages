$package = 'AdobeAIR'

$params = @{
    packageName  = $package;
    fileType     = 'exe';
    silentArgs   = '-silent -eulaAccepted';
    url          = 'https://airsdk.harman.com/assets/downloads/AdobeAIR.exe'
    checksum     = 'ac6a65976b583b64c11d4592037f25f8115e755e74b31a55c816627a0449b547'
    checksumType = 'SHA256'
}

Install-ChocolateyPackage @params
