$package = 'AdobeAIR'

$params = @{
    packageName  = $package;
    fileType     = 'exe';
    silentArgs   = '-silent -eulaAccepted';
    url          = 'https://airsdk.harman.com/assets/downloads/51.1.3.4/AdobeAIR.exe'
    checksum     = 'c1c96b238fcced07aa0381d781ad5d09279b8fd9a636fd5160cf59bc33d6653b'
    checksumType = 'SHA256'
}

Install-ChocolateyPackage @params
