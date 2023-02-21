#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1

$repoOwner = 'endless-sky'
$repoName = 'endless-sky'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            '(^\s*url\s*=\s*)(''.*'')'              = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"       = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\s*checksumType\s*=\s*)('.*')"   = "`$1'$($Latest.ChecksumType32)'"
            '(^\s*url64\s*=\s*)(''.*'')'            = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')"       = "`$1'$($Latest.Checksum64)'"
            "(?i)(^\s*checksumType64\s*=\s*)('.*')"   = "`$1'$($Latest.ChecksumType64)'"
        }
    }
}

function global:au_BeforeUpdate {
    $Latest.Checksum32 = Get-RemoteChecksum $Latest.Url32
    $Latest.ChecksumType32 = 'SHA256'
    $Latest.Checksum64 = Get-RemoteChecksum $Latest.Url64
    $Latest.ChecksumType64 = 'SHA256'
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

    $asset64 = $release.assets | Where-Object name -Match 'EndlessSky-win64-v([\d\.]+).zip'
    $asset32 = $release.assets | Where-Object name -Match 'EndlessSky-win32-v([\d\.]+).zip'

    return @{
        URL32        = $asset32.browser_download_url
        URL64        = $asset64.browser_download_url
        Version      = $version
    }
}

update -ChecksumFor none