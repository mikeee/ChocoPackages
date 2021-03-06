#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1

$releases    = 'https://www.corsair.com/ww/en/icue'

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
    $regexUrl = '(?<url>https:\/\/downloads.corsair.com\/Files\/CUE\/iCUESetup_(?<version>[\d\.]+)_release.msi)'

    $url = $page.links | Where-Object href -match $regexUrl | Select-Object -First 1 -expand href

    If ($null -ne $url) {
        $url = $matches.url
        $version = $matches.version
    }

    return @{
        URL        = $url
        Version    = $version
    }
}

update -ChecksumFor none