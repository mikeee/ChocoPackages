function Get-MsiAfterburnerDownloadUrl {
    $pageUrl = 'https://www.guru3d.com/download/msi-afterburner-beta-download/'
    $userAgent = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 Chrome/127.0.0.0 Safari/537.36'

    $page = Invoke-WebRequest -Uri $pageUrl -UserAgent $userAgent -UseBasicParsing
    $formMatch = [regex]::Match($page.Content, '<button[^>]*name="aform"[^>]*value="([^"]+)"')
    if (-not $formMatch.Success) {
        throw 'Guru3D download form not found'
    }

    $post = Invoke-WebRequest -Uri $pageUrl -Method Post -Body @{ aform = $formMatch.Groups[1].Value } `
        -UserAgent $userAgent -Headers @{ Referer = $pageUrl } -UseBasicParsing
    $downloadLink = [regex]::Match($post.Content, 'https://www\.guru3d\.com/getdownload/[0-9a-f]+').Value
    if (-not $downloadLink) {
        throw 'Guru3D download link not found'
    }

    # The getdownload endpoint answers with a 302 to the file; read the Location header without following it.
    $request = [System.Net.HttpWebRequest]::Create($downloadLink)
    $request.AllowAutoRedirect = $false
    $request.UserAgent = $userAgent
    $request.Referer = $pageUrl
    try {
        $response = $request.GetResponse()
    } catch [System.Net.WebException] {
        $response = $_.Exception.Response
    }

    try {
        $location = $response.Headers['Location']
    } finally {
        $response.Close()
    }
    if (-not $location) {
        throw 'Guru3D getdownload did not return a file location'
    }

    return $location
}
