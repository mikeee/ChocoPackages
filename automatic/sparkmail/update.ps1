#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1

$releases    = 'https://sparkmailapp.com/download'

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
    $regexVersion = '(?<url>dist\/(?<version>[\d\.]+)\/Spark.exe)'

    $matched = $page.Content -match $regexVersion

    If ($False -ne $matchedurl) {
        $url = -join("https://downloads.sparkmailapp.com/Spark3/win/dist/",$matches["version"],"/Spark.exe")
        $version = $matches["version"]
    }

    return @{
        URL        = $url
        Version    = $version
    }
}

Update-Package