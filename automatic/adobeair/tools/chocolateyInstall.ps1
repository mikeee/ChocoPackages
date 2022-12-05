$package = 'AdobeAIR'

$params = @{
    packageName  = $package;
    fileType     = 'exe';
    silentArgs   = '-silent -eulaAccepted';
    url          = ""
    checksum     = ''
    checksumType = 'sha256'
}

Install-ChocolateyPackage @params