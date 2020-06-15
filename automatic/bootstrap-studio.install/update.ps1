#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1

$releases    = 'https://bootstrapstudio.io/download/'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            '(^\s*url\s*=\s*)(''.*'')'              = "`$1'$($Latest.URL)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"       = "`$1'$($Latest.Checksum)'"
            "(?i)(^\s*checksumType\s*=\s*)('.*')"   = "`$1'$($Latest.ChecksumType)'"
        }
    }
}

function global:au_BeforeUpdate {
    $Latest.Checksum = Get-RemoteChecksum $Latest.Url
    $Latest.ChecksumType = 'SHA256'
}

function global:au_AfterUpdate {
    Set-DescriptionFromReadme -SkipFirst 2
}

function global:au_GetLatest {
    $page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $regexUrl = '(?<url>\/releases\/desktop/(?<version>[\d\.]+)\/Bootstrap%20Studio.exe)'

    $url = $page.links | Where-Object href -match $regexUrl | Select-Object -First 1 -expand href

    If ($null -ne $url) {
        $url = $matches.url
        $version = $matches.version
    }

    return @{
        URL        = "https://bootstrapstudio.io$url"
        Version    = $version
    }
}

update -ChecksumFor none

