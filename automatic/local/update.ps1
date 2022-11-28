#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1

$releases    = 'https://localwp.com/releases/'

go mod tidy

$url = go run getversion.go

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            '(^\s*url\s*=\s*)(''.*'')'            = "`$1'$($Latest.URL)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"       = "`$1'$($Latest.Checksum)'"
            "(?i)(^\s*checksumType\s*=\s*)('.*')"   = "`$1'$($Latest.ChecksumType)'"
        }
    }
}

function global:au_BeforeUpdate {
    $Latest.Checksum     = Get-RemoteChecksum $Latest.URL
    $Latest.ChecksumType = 'SHA256'
}

function global:au_AfterUpdate {
    Set-DescriptionFromReadme -SkipFirst 2
}

function global:au_GetLatest {
    $regexUrl = '(?<url>https:\/\/cdn.localwp.com\/releases-stable\/(?<version>[\d\.]+)\+[\d]+\/local-[\d\.]+-windows.exe)'

    $url -match $regexUrl

    return @{
        URL          = $matches.url
        Version      = $matches.version
    }
}

update -ChecksumFor none