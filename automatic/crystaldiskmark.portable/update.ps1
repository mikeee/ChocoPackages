#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1

$releases    = 'https://sourceforge.net/p/crystaldiskmark/activity'

function global:au_SearchReplace {
    @{
        ".\legal\VERIFICATION.txt" = @{
            "(?i)(listed on\s*)\<.*\>" = "`${1}<$releases>"
            "(?i)(URL.+)\<.*\>"     = "`${1}<$($Latest.URL)>"
            "(?i)(file_checksum:).*"      = "`${1} $($Latest.Checksum)"
        }
    }
}

function global:au_BeforeUpdate {
    Invoke-WebRequest -Uri $Latest.URL -UserAgent [Microsoft.PowerShell.Commands.PSUserAgent]::FireFox `
        -UseBasicParsing -OutFile 'tools\crystaldiskmark.zip'
}

function global:au_AfterUpdate {
    Set-DescriptionFromReadme -SkipFirst 2
}

function global:au_GetLatest {
    $page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $regexUrl = '\/CrystalDiskMark(?<version>(?<major>\d_\d_\d)(?<minor>\S?)).zip'

    $page.links | Where-Object href -match $regexUrl | Select-Object -First 1 -expand href

    $versionDL = $matches.version
    $versionMajor = $matches.major -replace '_', '.'
    if ($matches.minor) {
        $versionMinor = [int][char]$matches.minor
        $versionChoco = $versionMajor + "." + $versionMinor
    } else {
        $versionChoco = $versionMajor
    }

    $url        = "https://netcologne.dl.sourceforge.net/project/crystaldiskmark/$versionMajor$versionMinor/CrystalDiskMark$versionDL.zip"

    $checksum   = Get-RemoteChecksum $url

    return @{
        URL        = $url
        Version    = $versionChoco
        Checksum   = $checksum
    }
}

update -ChecksumFor none

