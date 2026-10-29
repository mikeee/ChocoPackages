#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1

$releases    = 'https://bootstrapstudio.io/pages/releases'

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
    # The /download/ page is behind a Cloudflare challenge, so read the releases page instead
    $page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $versions = [regex]::Matches($page.Content, '\b\d+\.\d+\.\d+\b') |
        ForEach-Object { [version]$_.Value } |
        Sort-Object -Descending -Unique

    if (-not $versions) {
        throw "No versions found on $releases"
    }

    $version = $versions[0].ToString()
    $url = "https://releases.bootstrapstudio.io/$version/Bootstrap%20Studio%20-%20Setup.exe"

    # Make sure the installer actually exists before handing it to AU
    try {
        Invoke-WebRequest -Uri $url -Method Head -UseBasicParsing | Out-Null
    }
    catch {
        throw "Installer for $version not reachable at $url : $($_.Exception.Message)"
    }

    return @{
        URL        = $url
        Version    = $version
    }
}

update -ChecksumFor none

