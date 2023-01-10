$package = 'AdobeAIR'

$params = @{
    packageName  = $package;
    fileType     = 'exe';
    silentArgs   = '-silent -eulaAccepted';
    url          = 'https://airsdk.harman.com/assets/downloads/AdobeAIR.exe'
    checksum     = '070ffe61e44b8e7142ac48bcd20b52269801196a8f1b5cacff8e42e443fcd86c'
    checksumType = 'SHA256'
}

Install-ChocolateyPackage @params
