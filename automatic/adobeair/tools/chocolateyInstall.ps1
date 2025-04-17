$package = 'AdobeAIR'

$params = @{
    packageName  = $package;
    fileType     = 'exe';
    silentArgs   = '-silent -eulaAccepted';
    url          = 'https://airsdk.harman.com/assets/downloads/51.2.1.1/AdobeAIR.exe'
    checksum     = '0618e1e5a43fc6ef58116bcfb44d9b443a4003f718767350a07f183c27958d62'
    checksumType = 'SHA256'
}

Install-ChocolateyPackage @params
