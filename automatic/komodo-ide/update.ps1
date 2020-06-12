#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1

$releases    = 'https://www.activestate.com/products/komodo-ide/download-ide/'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            '(^\s*url\s*=\s*)(''.*'')'              = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"       = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\s*checksumType\s*=\s*)('.*')"   = "`$1'$($Latest.ChecksumType32)'"
        }
    }
}

function global:au_BeforeUpdate {
    $Latest.Checksum32 = Get-RemoteChecksum $Latest.Url32
    $Latest.ChecksumType32 = 'SHA256'
}

function global:au_AfterUpdate {
    Set-DescriptionFromReadme -SkipFirst 2
}

function global:au_GetLatest {
    $page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $regexUrl32 = '(?<url>https:\/\/downloads.activestate.com\/Komodo\/releases\/[\d.]+\/Komodo-IDE-(?<version>[\d\.]+)-[\d]+.msi)'

    $url32 = $page.links | Where-Object href -match $regexUrl32 | Select-Object -First 1 -expand href

    If ($null -ne $url32) {
        $url = $matches.url
        $version = $matches.version
    }

    return @{
        URL32        = $url
        Version      = $version
    }
}

update -ChecksumFor none