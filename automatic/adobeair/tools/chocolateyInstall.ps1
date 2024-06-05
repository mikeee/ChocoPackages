$package = 'AdobeAIR'

$params = @{
    packageName  = $package;
    fileType     = 'exe';
    silentArgs   = '-silent -eulaAccepted';
    url          = 'https://airsdk.harman.com/assets/downloads/AdobeAIR.exe'
    checksum     = '987c15dd00232694e1cb4c148fdc2b10f2418616b7612be158693240062096d6'
    checksumType = 'SHA256'
}

Install-ChocolateyPackage @params
