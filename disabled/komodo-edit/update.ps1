#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1

$releases    = 'https://www.activestate.com/products/komodo-ide/downloads/edit/'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            '(^\s*url64\s*=\s*)(''.*'')'            = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')"       = "`$1'$($Latest.Checksum64)'"
            "(?i)(^\s*checksumType64\s*=\s*)('.*')"   = "`$1'$($Latest.ChecksumType64)'"
        }
    }
}

function global:au_BeforeUpdate {
    $Latest.Checksum64 = Get-RemoteChecksum $Latest.Url64
    $Latest.ChecksumType64 = 'SHA256'
}

function global:au_AfterUpdate {
    Set-DescriptionFromReadme -SkipFirst 2
}

function global:au_GetLatest {
    $page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $regexUrl = '(?<url>https:\/\/downloads.activestate.com\/Komodo\/releases\/[\d.]+\/Komodo-Edit-(?<version>[\d\.]+)-[\d]+.msi)'

    $page.links | Where-Object href -match $regexUrl | Select-Object -First 1 -expand href

    $url = $matches.url
    $version = $matches.version

    return @{
        URL64        = $url
        Version      = $version
    }
}

update -ChecksumFor none