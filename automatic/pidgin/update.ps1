#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1

$releases    = 'https://sourceforge.net/projects/pidgin/files/Pidgin/'

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
    $regexVersion = '\/pidgin\/files\/Pidgin\/(?<version>[\d\.]+)\/'

    $page.links | Where-Object href -match $regexVersion | Select-Object -First 1 -expand href
    $version = $matches.version

    return @{
        URL        = "https://netcologne.dl.sourceforge.net/project/pidgin/Pidgin/$version/pidgin-$version-offline.exe"
        Version    = $version
    }
}

update -ChecksumFor none