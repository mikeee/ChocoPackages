#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1

$releases    = 'https://zebra.my.site.com/ChineseCommunity/articles/en_US/Knowledge/000022299'

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
    $Latest.Checksum = Get-RemoteChecksum $Latest.URL
    $Latest.ChecksumType = 'SHA256'
}

function global:au_AfterUpdate {
    Set-DescriptionFromReadme -SkipFirst 2
}

function global:au_GetLatest {
    $page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $regexVersion = 'zebradesigner(?<versionmajor>[\d])-(?<versionminor>[\d]+).exe'

    $matched = $page.Content -match $regexVersion

    $versionMajor =

    If ($False -ne $matchedurl) {
        $url = -join("https://www.zebra.com/content/dam/support-dam/en/application/unrestricted/0001/zebradesigner", $matches["versionmajor"], "-", $matches["versionminor"], ".exe")
        $version = -join($matches["versionmajor"], ".", $matches["versionminor"])
    }

    return @{
        URL        = $url
        Version    = $version
    }
}

Update-Package