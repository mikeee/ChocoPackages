#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1

$releases    = 'https://sourceforge.net/p/crystaldiskmark/activity'

function global:au_SearchReplace {
    @{
        ".\legal\VERIFICATION.txt" = @{
            "(?i)(listed on\s*)\<.*\>" = "`${1}<$releases>"
            "(?i)(32-Bit.+)\<.*\>"     = "`${1}<$($Latest.URL32)>"
            "(?i)(checksum type:).*"   = "`${1} $($Latest.ChecksumType32)"
            "(?i)(checksum32:).*"      = "`${1} $($Latest.Checksum32)"
        }
    }
}

function global:au_BeforeUpdate {
    Get-RemoteFiles -Purge
}

function global:au_AfterUpdate {
    Set-DescriptionFromReadme -SkipFirst 2
}

function global:au_GetLatest {
    $page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $regexUrl = '\/CrystalDiskMark(?<version>(?<major>\d_\d_\d)(?<minor>\S?)).exe'

    $page.links | Where-Object href -match $regexUrl | Select-Object -First 1 -expand href

    $versionDL = $matches.version
    $versionMajor = $matches.major -replace '_', '.'
    if ($matches.minor) {
        $versionMinor = [int][char]$matches.minor
        $versionChoco = $versionMajor + "." + $versionMinor
    } else {
        $versionChoco = $versionMajor
    }

    return @{
        URL32        = "https://netcologne.dl.sourceforge.net/project/files/$versionMajor$versionMinor/CrystalDiskMark$versionDL.exe/download"
        Version    = $versionChoco
        FileType   = 'exe'
    }
}

update -ChecksumFor none

