#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1

$releaseBaseUrl = "https://airsdk.harman.com/assets/downloads/"

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

    go mod tidy

    $url = go run getversion.go

    $regexUrl = 'AIR\sruntime\s-\sversion\s(?<version>[\d\.]+)'

    $url -match $regexUrl

    $releaseUrl = $releaseBaseUrl + $matches.version + '/AdobeAIR.exe'

    return @{
        URL          = $releaseUrl
        Version      = $matches.version
    }
}

update -ChecksumFor none

