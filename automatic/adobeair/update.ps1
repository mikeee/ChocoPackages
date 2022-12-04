#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1

$releases = "https://airsdk.harman.com/runtime"
$releaseUrl = "https://airsdk.harman.com/assets/downloads/AdobeAIR.exe"

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
    $Latest.Checksum = Get-RemoteChecksum $Latest.URL
    $Latest.ChecksumType = 'SHA256'
}

function global:au_AfterUpdate {
    Set-DescriptionFromReadme -SkipFirst 2
}

function global:au_GetLatest {
    $page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $regexVersion = 'AIR\sruntime\s-\sversion\s(?<version>[\d\.]+)'
    $page.Content -match $regexVersion
    $version = $matches["version"]

    return @{
        URL        = $releaseUrl
        Version    = $version
    }
}

update -ChecksumFor none

