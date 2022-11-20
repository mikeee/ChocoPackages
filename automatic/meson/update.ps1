#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1

$repoOwner = 'mesonbuild'
$repoName = 'meson'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            '(^\s*url64\s*=\s*)(''.*'')'            = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')"       = "`$1'$($Latest.Checksum64)'"
            "(?i)(^\s*checksumType64\s*=\s*)('.*')"   = "`$1'$($Latest.ChecksumType64)'"
        }
    }
}

function global:au_BeforeUpdate {
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

    $asset = $release.assets | Where-Object name -Match 'meson-([\d\.]+)-64.msi'

    return @{
        URL64             = $asset.browser_download_url
        Version           = $version
    }
}

update -ChecksumFor none