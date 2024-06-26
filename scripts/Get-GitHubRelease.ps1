<#
.SYNOPSIS
    Gets the latest or a specific release of a given GitHub repository
.EXAMPLE
    Get-GitHubRelease cloudflare cloudflared
.NOTES
    Originally written by James Ruskin in this PR https://github.com/chocolatey-community/chocolatey-packages/pull/2013
    co-authored by Paul Broadwith.
#>
function Get-GitHubRelease {
    [CmdletBinding()]
    param(
        # Repository owner
        [Parameter(Mandatory, Position = 0)]
        [string]$OwnerName,

        # Repository name
        [Parameter(Mandatory, Position = 1)]
        [string]$RepositoryName,

        # The Name of the tag to get the release for. Will default to the latest release.
        [ValidateNotNullOrEmpty()]
        [string]$Tag = 'latest',

        # this is only here to be compatible with PowerShellForGitHub module and so I don't need to update the package
        # code. It does nothing.
        [switch]
        $Latest,

        # GitHub token, used to reduce rate-limiting or access private repositories (needs repo scope)
        [string]$AccessToken = $env:github_api_key
    )

    end {
        $apiUrl = "https://api.github.com/repos/$OwnerName/$RepositoryName/releases/latest"

        if ($Tag -and $Tag -ne 'latest') {
            $apiUrl = "https://api.github.com/repos/$OwnerName/$RepositoryName/releases/tags/$Tag"
        }

        $Request = @{
            Uri = $apiUrl
        }

        if (-not [string]::IsNullOrEmpty($AccessToken)) {
            $Request.Headers = @{
                Accept        = 'application/vnd.github+json'
                Authorization = "Bearer $($AccessToken)"
            }
        }

        Invoke-RestMethod @Request
    }
}