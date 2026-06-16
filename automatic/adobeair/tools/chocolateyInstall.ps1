$package = 'AdobeAIR'

$params = @{
    packageName  = $package;
    fileType     = 'exe';
    silentArgs   = '-silent -eulaAccepted';
    url          = 'https://airsdk.harman.com/assets/downloads/51.3.3.1/AdobeAIR.exe'
    checksum     = '42a41788893a05a1c0bdfd88ed0ddf974b3ed9e2a7d7e89c3d56ecc38a33d462'
    checksumType = 'SHA256'
}

Install-ChocolateyPackage @params
