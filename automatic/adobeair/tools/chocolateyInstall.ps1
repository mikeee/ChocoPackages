$package = 'AdobeAIR'

$params = @{
    packageName  = $package;
    fileType     = 'exe';
    silentArgs   = '-silent -eulaAccepted';
    url          = 'https://airsdk.harman.com/assets/downloads/51.1.2.2/AdobeAIR.exe'
    checksum     = '896c9c71c355fbccf976119dccfd1d070b7a514c84a184e1ac1ad0b5ac4e2dfa'
    checksumType = 'SHA256'
}

Install-ChocolateyPackage @params
