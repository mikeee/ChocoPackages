#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1

$releases    = 'https://www.zebra.com/gb/en/support-downloads/printer-software/zebra-designer-3-developer.html'

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
    $regexVersion = 'zebradesigner(?<versionmajor>[\d])-developers-(?<versionminor>[\d]+).exe'

    $matched = $page.Content -match $regexVersion

    $versionMajor =

    If ($False -ne $matchedurl) {
        $url = -join("https://www.zebra.com/content/dam/zebra_new_ia/en-us/software-printer/productivity-apps/zebra-designer-3/zebradesigner", $matches["versionmajor"], "-developers-", $matches["versionminor"], ".exe")
        $version = -join($matches["versionmajor"], ".", $matches["versionminor"])
    }

    return @{
        URL        = $url
        Version    = $version
    }
}

Update-Package