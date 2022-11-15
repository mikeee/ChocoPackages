#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1

$releases    = 'https://www.superantispyware.com/downloadfile.html?productid=SUPERANTISPYWAREFREE'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            '(^\s*url\s*=\s*)(''.*'')'              = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"       = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\s*checksumType\s*=\s*)('.*')"   = "`$1'$($Latest.ChecksumType32)'"
        }
    }
}

function global:au_AfterUpdate {
    Set-DescriptionFromReadme -SkipFirst 2
}

function global:au_GetLatest {
    $page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $regexPage = 'Version:[\s]+(?<version>[\d.]+)'

    $matched = $page.Content -match $regexPage

    $version = $matches["version"]

    $url = "https://securedownloads.superantispyware.com/SUPERAntiSpyware.exe"

    return @{
        URL32        = $url
        Version      = $version
    }
}

update