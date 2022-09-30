#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1

$releases    = 'https://github.com/pawelsalawa/sqlitestudio/releases'

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
    $regexUrl = 'pawelsalawa\/sqlitestudio\/releases\/tag\/(?<version>[\d\.]+)'

    $url32 = $page.links | Where-Object href -match $regexUrl32 | Select-Object -First 1 -expand href

    $ver = $matches.version

    return @{
        URL32        = "https://github.com/pawelsalawa/sqlitestudio/releases/download/$ver/sqlitestudio-$ver.zip"
        Version      = $ver
    }
}

update -ChecksumFor none