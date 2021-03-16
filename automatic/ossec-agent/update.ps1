#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1

$releases    = 'https://www.ossec.net/download-ossec/'

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
    $regexUrl = '(?<url>https:\/\/updates.atomicorp.com\/channels\/atomic\/windows\/ossec-agent-win32-(?<version>[\d.]+-[\d.]+).exe)'

    $page.links | Where-Object href -match $regexUrl | Select-Object -First 1 -expand href

    $url = $matches.url
    $version = $matches.version -replace '-', '.'

    return @{
        URL        = $url
        Version    = $version
    }
}

update -ChecksumFor none

