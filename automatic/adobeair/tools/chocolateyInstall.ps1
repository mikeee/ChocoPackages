$package = 'AdobeAIR'

$params = @{
    packageName  = $package;
    fileType     = 'exe';
    silentArgs   = '-silent -eulaAccepted';
    url          = 'https://airsdk.harman.com/assets/downloads/51.2.1.5/AdobeAIR.exe'
    checksum     = 'f4e929c3cd04df980286e469b514b8ab4a448e828fd5e426e93a3ab3efe3c955'
    checksumType = 'SHA256'
}

Install-ChocolateyPackage @params
