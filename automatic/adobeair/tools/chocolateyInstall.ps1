$package = 'AdobeAIR'

$params = @{
    packageName  = $package;
    fileType     = 'exe';
    silentArgs   = '-silent -eulaAccepted';
    url          = 'https://airsdk.harman.com/assets/downloads/AdobeAIR.exe'
    checksum     = '859dfd7495971139a5d7eb907f02ca2b868f1e7d5844dc2cc1f58f756bd78cc6'
    checksumType = 'SHA256'
}

Install-ChocolateyPackage @params
