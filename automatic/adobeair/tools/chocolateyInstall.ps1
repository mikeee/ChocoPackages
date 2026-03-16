$package = 'AdobeAIR'

$params = @{
    packageName  = $package;
    fileType     = 'exe';
    silentArgs   = '-silent -eulaAccepted';
    url          = 'https://airsdk.harman.com/assets/downloads/51.3.1.2/AdobeAIR.exe'
    checksum     = '1de2227b24842fae53574291ad112af6545f4e01fd9e98ead6b54d26de2e6f2b'
    checksumType = 'SHA256'
}

Install-ChocolateyPackage @params
