#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1

$releases    = 'https://api.github.com/repos/pawelsalawa/sqlitestudio/releases?per_page=30'

function global:au_SearchReplace {
    @{
        "$($Latest.PackageName).nuspec" = @{
            "(\<dependency .+?`"letos.install`" version=)`"([^`"]+)`"" = "`$1`"$($Latest.Version)`""
        }
    }
}

function global:au_GetLatest {
    $releasesApi = Invoke-RestMethod -Uri $releases
    $ver = ($releasesApi | Where-Object { $_.tag_name -like '4.*' -and -not $_.prerelease } | Select-Object -First 1).tag_name
    if (-not $ver) { throw 'No Letos 4.x release found' }

    return @{
        Version = $ver
    }
}

function global:au_BeforeUpdate { }

update -ChecksumFor none
