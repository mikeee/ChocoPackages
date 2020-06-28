#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1

$releases    = 'https://osdn.net/projects/crystaldiskmark/releases/'

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
    $regexUrl = '\/crystaldiskmark\/downloads\/(?<revision>[\d.]+)\/CrystalDiskMark(?<version>(?<major>\d_\d_\d)(?<minor>\S?)).zip\/'

    $page.links | Where-Object href -match $regexUrl | Select-Object -First 1 -expand href

    $versionDL = $matches.version
    $versionMajor = $matches.major -replace '_', '.'
    $versionMinor = [int][char]$matches.minor
    $versionChoco = $versionMajor + "." + $versionMinor
    $revision   = $matches.revision

    return @{
        URL        = "https://osdn.net/frs/redir.php?m=dotsrc&f=crystaldiskmark/$revision/CrystalDiskMark$versionDL.exe"
        Version    = $versionChoco
    }
}

update -ChecksumFor none

