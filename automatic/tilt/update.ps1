#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1

$repoOwner = 'tilt-dev'
$repoName = 'tilt'

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
    $release = Get-GitHubRelease -OwnerName $repoOwner -RepositoryName $repoName -Latest

    $version = $release.tag_name
    # Remove the leading 'v' from the tag name if it exists
    if ($version.StartsWith('v')) {
        $version = $version.Substring(1)
    }

    $asset = $release.assets | Where-Object name -Match 'tilt.([\d\.]+)windows.x86_64.zip$'

    return @{
        URL             = $asset.browser_download_url
        Version         = $version
    }
}

update -ChecksumFor none