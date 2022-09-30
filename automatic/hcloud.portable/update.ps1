#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1

$releases    = 'https://github.com/hetznercloud/cli/releases'

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
    $Latest.Checksum32 = Get-RemoteChecksum $Latest.Url32
    $Latest.ChecksumType32 = 'SHA256'
    $Latest.Checksum64 = Get-RemoteChecksum $Latest.Url64
    $Latest.ChecksumType64 = 'SHA256'
}

function global:au_AfterUpdate {
    Set-DescriptionFromReadme -SkipFirst 2
}

function global:au_GetLatest {
    $page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $regexUrl = '/download\/v(?<version>[\d\.]+)\/checksums.txt'

    $match = $page.links | Where-Object href -match $regexUrl | Select-Object -First 1 -expand href

    $url32 = "https://github.com/hetznercloud/cli/releases/download/v"+$matches.version+"/hcloud-windows-386.zip"

    $url32 = "https://github.com/hetznercloud/cli/releases/download/v"+$matches.version+"/hcloud-windows-amd64.zip"



    return @{
        URL32        = $url32
        URL64        = $url64
        Version      = $matches.version
    }
}

update -ChecksumFor none