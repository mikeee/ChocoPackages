#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1

$releases    = 'https://api.github.com/repos/pawelsalawa/sqlitestudio/releases?per_page=30'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            '(^\s*url64\s*=\s*)(''.*'')'              = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')"       = "`$1'$($Latest.Checksum64)'"
            "(?i)(^\s*checksumType64\s*=\s*)('.*')"   = "`$1'$($Latest.ChecksumType64)'"
        }
    }
}

function global:au_BeforeUpdate {
    $Latest.Checksum64 = Get-RemoteChecksum $Latest.URL64
    $Latest.ChecksumType64 = 'SHA256'
}

function global:au_AfterUpdate {
    Set-DescriptionFromReadme -SkipFirst 2
}

function global:au_GetLatest {
    # Letos is the 4.x line of this project; the API lists releases newest first
    $releasesApi = Invoke-RestMethod -Uri $releases
    $ver = ($releasesApi | Where-Object { $_.tag_name -like '4.*' -and -not $_.prerelease } | Select-Object -First 1).tag_name
    if (-not $ver) { throw 'No Letos 4.x release found' }

    return @{
        URL64        = "https://github.com/pawelsalawa/sqlitestudio/releases/download/$ver/Letos-$ver-windows-x64-setup.exe"
        Version      = $ver
    }
}

update -ChecksumFor none
