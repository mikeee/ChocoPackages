$package = 'AdobeAIR'

$params = @{
    packageName  = $package;
    fileType     = 'exe';
    silentArgs   = '-silent -eulaAccepted';
    url          = 'https://airsdk.harman.com/assets/downloads/51.3.2.3/AdobeAIR.exe'
    checksum     = '94551703874da5d909ae4b725b2c7c0bb747fff33841218db231542ce6cbb68f'
    checksumType = 'SHA256'
}

Install-ChocolateyPackage @params
