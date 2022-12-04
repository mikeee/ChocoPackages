$package = 'AdobeAIR'

$params = @{
    PackageName  = $package;
    FileType     = 'exe';
    SilentArgs   = '-silent -eulaAccepted';
    Url          = ""
    Checksum     = ''
    ChecksumType = 'sha256'
}

Install-ChocolateyPackage @params