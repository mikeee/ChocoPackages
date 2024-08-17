$package = 'AdobeAIR'

$params = @{
    packageName  = $package;
    fileType     = 'exe';
    silentArgs   = '-silent -eulaAccepted';
    url          = 'https://airsdk.harman.com/assets/downloads/AdobeAIR.exe'
    checksum     = 'da506fa70f7953e840f3eba28faf557a2038e0b3d0a5105a0ebe3434ee5e9e61'
    checksumType = 'SHA256'
}

Install-ChocolateyPackage @params
