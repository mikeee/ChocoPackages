#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1

$releases    = 'https://app-updates.agilebits.com/product_history/CLI2'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            '(^\s*url\s*=\s*)(''.*'')'              = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"       = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\s*checksumType\s*=\s*)('.*')"   = "`$1'$($Latest.ChecksumType32)'"
            '(^\s*url64\s*=\s*)(''.*'')'            = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')"       = "`$1'$($Latest.Checksum64)'"
            "(?i)(^\s*checksumType64\s*=\s*)('.*')"   = "`$1'$($Latest.ChecksumType64)'"
        }
    }
}

function global:au_BeforeUpdate {
    $Latest.Checksum32 = Get-RemoteChecksum $Latest.URL32
    $Latest.ChecksumType32 = 'SHA256'
    $Latest.Checksum64 = Get-RemoteChecksum $Latest.URL64
    $Latest.ChecksumType64 = 'SHA256'
}

function global:au_AfterUpdate {
    Set-DescriptionFromReadme -SkipFirst 2
}

function global:au_GetLatest {
    $page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $regexUrl32 = '\/op_windows_386_v(?<version>[\d\.]+).zip'
    $regexUrl64 = '\/op_windows_amd64_v(?<version>[\d\.]+).zip'

    $url32 = $page.links | Where-Object href -match $regexUrl32 | Select-Object -First 1 -expand href
    $url64 = $page.links | Where-Object href -match $regexUrl64 | Select-Object -First 1 -expand href



    return @{
        URL32        = $url32
        URL64        = $url64

        Version      = $matches.version
    }
}

update -ChecksumFor none