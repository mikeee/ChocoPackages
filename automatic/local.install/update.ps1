#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1

$releases    = 'https://localwp.com/releases/'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            '(^\s*url64\s*=\s*)(''.*'')'            = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')"       = "`$1'$($Latest.Checksum64)'"
            "(?i)(^\s*checksumType64\s*=\s*)('.*')"   = "`$1'$($Latest.ChecksumType64)'"
        }
    }
}

function global:au_AfterUpdate {
    Set-DescriptionFromReadme -SkipFirst 2
}

function global:au_GetLatest {
    $page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $regexUrl64 = '(?<url>https:\/\/cdn.localwp.com\/releases-stable\/(?<version>[\d\.]+)\+[\d]+\/local-[\d\.]+-windows.exe)'

    $search = $page.links | Where-Object href -match $regexUrl64 | Select-Object -First 1 -expand href

    return @{
        URL64        = $matches.url
        Version      = $matches.version
    }
}

update -ChecksumFor none