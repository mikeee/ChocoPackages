#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1

$releases    = 'https://osdn.net/projects/crystaldiskmark/releases/'

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
    $regexUrl = '\/crystaldiskmark\/downloads\/(?<revision>[\d.]+)\/CrystalDiskMark(?<version>(?<major>\d_\d_\d)(?<minor>\S?)).zip\/'

    $page.links | Where-Object href -match $regexUrl | Select-Object -First 1 -expand href

    $versionDL = $matches.version
    $versionMajor = $matches.major -replace '_', '.'
    $versionMinor = [int][char]$matches.minor
    $versionChoco = $versionMajor + "." + $versionMinor
    $revision   = $matches.revision

    return @{
        URL32        = "https://osdn.net/frs/redir.php?m=dotsrc&f=crystaldiskmark/$revision/CrystalDiskMark$versionDL.exe"
        Version    = $versionChoco
        FileType   = 'exe'
    }
}

update -ChecksumFor none

