#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1

$releases    = 'https://www.emsisoft.com/en/tools/emergencykit/'
$download    = 'https://dl.emsisoft.com/EmsisoftEmergencyKit.exe'

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
    $Latest.Checksum = Get-RemoteChecksum $Latest.Url
    $Latest.ChecksumType = 'SHA256'
}

function global:au_AfterUpdate {
    Set-DescriptionFromReadme -SkipFirst 2
}

function global:au_GetLatest {
    $page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $regex = 'Version (?<version>[\d.]+) &#8211; Released:'

    $page.Content -match $regex

    $version = $matches.version

    return @{
        URL        = $download
        Version    = $version
    }
}

update -ChecksumFor none