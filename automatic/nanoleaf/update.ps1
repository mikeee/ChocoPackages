#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1

$releases    = 'https://my.nanoleaf.me/api/v2/desktopApp/latest/win'
$checksumType = 'SHA256'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            '(^\s*url\s*=\s*)(''.*'')'              = "`$1'$($Latest.URL)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"       = "`$1'$($Latest.Checksum)'"
            "(?i)(^\s*checksumType\s*=\s*)('.*')"   = "`$1'$($Latest.ChecksumType)'"
        }
    }
}

function global:au_AfterUpdate {
    Set-DescriptionFromReadme -SkipFirst 2
}

function global:au_GetLatest {
    $tempFile = New-TemporaryFile
    $response = Invoke-WebRequest -Uri $releases -OutFile $tempFile -UseBasicParsing -PassThru

    $version = (Get-Item $tempfile).VersionInfo.FileVersion

    $checksum = Get-FileHash -Algorithm SHA256 -Path $tempFile -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Hash

    # The API redirects to the current S3 bucket (prod-3 at the moment), so take the final URL rather than building one
    $url = $response.BaseResponse.ResponseUri.AbsoluteUri

    return @{
        URL          = $url
        Checksum     = $checksum
        ChecksumType = $checksumType
        Version      = $version
    }
}

update -ChecksumFor none

