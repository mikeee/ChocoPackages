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

    # Match the x64 installer directly; the ARM64 build has its own link with a different name
    $regexVersion = 'https://[^"''\s]+/Windows/broadcast/[\d.]+/NVIDIA_Broadcast_v(?<version>[\d.]+)\.exe'

    $match = [regex]::Match($page.Content, $regexVersion)
    $url64 = $match.Value
    $version = $match.Groups['version'].Value

    return @{
        URL64        = $url64
        Version      = $version
    }
}

update -ChecksumFor none

