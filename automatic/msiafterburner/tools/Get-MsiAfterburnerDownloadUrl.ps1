function Get-MsiAfterburnerDownloadUrl {
    $tokenEndpoint = 'https://www.msi.com/api/v1/get_token'
    $downloadUrl = 'https://download.msi.com/uti_exe/vga/MSIAfterburnerSetup.zip'
    $timestamp = (Get-Date).ToUniversalTime().ToString('yyyyMMddHHmmss')
    $headers = @{
        Accept = 'application/json, text/plain, */*'
        'Accept-Language' = 'en-US,en;q=0.9'
        Referer = 'https://www.msi.com/Landing/afterburner'
        'X-Requested-With' = 'XMLHttpRequest'
    }
    $userAgent = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 Chrome/127.0.0.0 Safari/537.36'
    $tokenUri = '{0}?date={1}' -f $tokenEndpoint, $timestamp

    $response = Invoke-RestMethod -Uri $tokenUri -Headers $headers `
        -UserAgent $userAgent -UseBasicParsing
    $tokens = @($response)

    if ($tokens.Count -ne 1) {
        throw "MSI token API returned $($tokens.Count) tokens; expected exactly one"
    }

    $token = [string]$tokens[0]
    if ($token -notmatch '^exp=\d+~acl=/\*~hmac=[0-9a-f]{64}$') {
        throw 'MSI token API returned an invalid token'
    }

    return '{0}?__token__={1}' -f $downloadUrl, $token
}
