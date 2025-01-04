#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1

$releases    = 'https://www.nvidia.com/en-gb/geforce/broadcasting/broadcast-app/'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            '(^\s*url64\s*=\s*)(''.*'')'              = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')"       = "`$1'$($Latest.Checksum64)'"
            "(?i)(^\s*checksumType64\s*=\s*)('.*')"   = "`$1'$($Latest.ChecksumType64)'"
        }
    }
}

function global:au_BeforeUpdate {
    $Latest.Checksum64 = Get-RemoteChecksum $Latest.URL64
    $Latest.ChecksumType64 = 'SHA256'
}

function global:au_AfterUpdate {
    Set-DescriptionFromReadme -SkipFirst 2
}

function global:au_GetLatest {
    $page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $regexVersion = '\/Windows\/broadcast\/(?<versionmajor>[\d.]+)\/NVIDIA_Broadcast+_v(?<version>[\d.]+).exe'

    $url64 = $page.links | Where-Object href -match $regexVersion | Select-Object -Skip 2 -First 1 -expand href

    $version = $matches.version

    return @{
        URL64        = $url64
        Version      = $version
    }
}

update -ChecksumFor none

