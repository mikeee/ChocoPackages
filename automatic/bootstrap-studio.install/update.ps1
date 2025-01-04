#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1

$releases    = 'https://bootstrapstudio.io/download/'

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
    $regexVersion = '(?<url>(?<version>[\d\.]+)\/Bootstrap%20Studio%20-%20Setup.exe)'

    $matched = $page.Content -match $regexVersion

    If ($False -ne $matched) {
        $url = -join("https://releases.bootstrapstudio.io/",$matches["version"],"/Bootstrap%20Studio%20-%20Setup.exe")
        $version = $matches["version"]
    }

    return @{
        URL        = $url
        Version    = $version
    }
}

update -ChecksumFor none

