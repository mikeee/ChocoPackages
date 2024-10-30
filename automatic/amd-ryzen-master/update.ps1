#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1

$releases    = 'https://www.amd.com/en/products/software/ryzen-master.html'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            '(^\s*url\s*=\s*)(''.*'')'              = "`$1'$($Latest.URL)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"       = "`$1'$($Latest.Checksum)'"
            "(?i)(^\s*checksumType\s*=\s*)('.*')"   = "`$1'$($Latest.ChecksumType)'"
        }
    }
}

function global:au_AfterUpdate {
    Set-DescriptionFromReadme -SkipFirst 2
}

function global:au_GetLatest {
    $page = Invoke-WebRequest -Uri $releases -UseBasicParsing -UserAgent [Microsoft.PowerShell.Commands.PSUserAgent]::FireFox

    $regexUrl = 'https:\/\/download.amd.com\/Desktop\/amd-ryzen-master-(?<version>[\d\-]+)\.exe'

    $url = $page.links | Where-Object href -match $regexUrl | Select-Object -First 1 -expand href

    $rawVersion = $matches.version

    $versionParts = $rawVersion.ToString().Split('-')

    $finalVersion = "{0}.{1}.{2}.{3}" -f $versionParts[0], $versionParts[1], $versionParts[2], $versionParts[3]

    return @{
        URL          = $url
        Version      = $finalVersion
    }
}

update -ChecksumFor none

