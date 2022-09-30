#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1

$releases    = 'https://github.com/vultr/vultr-cli/releases'

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
    $regexUrl = 'vultr\/vultr-cli\/releases\/tag\/v(?<version>[\d\.]+)'

    $url64 = $page.links | Where-Object href -match $regexUrl | Select-Object -First 1 -expand href

    $ver = $matches.version

    return @{
        URL64        = "https://github.com/vultr/vultr-cli/releases/download/v$ver/vultr-cli_"+$ver+"_windows_64-bit.zip"
        Version      = $ver
    }
}

update -ChecksumFor none