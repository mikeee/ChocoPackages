#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1

$releases    = 'https://www.pidgin.im/install/'

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
    $regexVersion = 'pidgin-(?<version>[\d\.]+).exe'

    $page.links | Where-Object href -match $regexVersion | Select-Object -First 1 -expand href
    $version = $matches.version

    return @{
        URL32        = "https://sourceforge.net/projects/pidgin/files/Pidgin/$version/pidgin-$version-offline.exe/download"
        Version    = $version
    }
}

Update-Package
