$package = 'AdobeAIR'

$params = @{
    packageName  = $package;
    fileType     = 'exe';
    silentArgs   = '-silent -eulaAccepted';
    url          = 'https://airsdk.harman.com/assets/downloads/51.3.2.2/AdobeAIR.exe'
    checksum     = '3cb62107667fe91fe7bcdd602b8c3bba4e6f2fcc3e7e77335879ed1cf12c4584'
    checksumType = 'SHA256'
}

Install-ChocolateyPackage @params
