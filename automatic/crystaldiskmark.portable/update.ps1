#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1

$releases    = 'https://osdn.net/projects/crystaldiskmark/releases/'

function global:au_SearchReplace {
    @{
        ".\legal\VERIFICATION.txt" = @{
            "(?i)(listed on\s*)\<.*\>" = "`${1}<$releases>"
            "(?i)(URL.+)\<.*\>"     = "`${1}<$($Latest.URL)>"
            "(?i)(checksum_type:).*"   = "`${1} $($Latest.ChecksumType)"
            "(?i)(file_checksum:).*"      = "`${1} $($Latest.Checksum)"
        }
    }
}

function global:au_BeforeUpdate {
    $fileName   = "crystaldiskmark.zip"
    Get-RemoteFiles -Purge -FileNameBase $fileName -NoSuffix
}

function global:au_AfterUpdate {
    Set-DescriptionFromReadme -SkipFirst 2
}

function global:au_GetLatest {
    $page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $regexUrl = '\/crystaldiskmark\/downloads\/(?<revision>[\d.]+)\/CrystalDiskMark(?<version>(?<major>\d_\d_\d)(?<minor>\S?)).zip\/'

    $page.links | Where-Object href -match $regexUrl | Select-Object -First 1 -expand href

    $versionDL = $matches.version
    $versionMajor = $matches.major -replace '_', '.'
    if ($matches.minor) {
        $versionMinor = [int][char]$matches.minor
        $versionChoco = $versionMajor + "." + $versionMinor
    } else {
        $versionChoco = $versionMajor
    }
    $revision   = $matches.revision

    return @{
        URL        = "https://osdn.net/frs/redir.php?m=dotsrc&f=crystaldiskmark/$revision/CrystalDiskMark$versionDL.zip"
        Version    = $versionChoco
    }
}

update -ChecksumFor none

