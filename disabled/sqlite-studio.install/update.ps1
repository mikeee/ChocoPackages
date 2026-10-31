#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1

$releases    = 'https://github.com/pawelsalawa/sqlitestudio/releases'

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
    # The repo now also ships Letos 4.x releases, so only follow the SQLiteStudio 3.x line.
    # The API lists newest first; the releases HTML page lists tags oldest first.
    $releasesApi = Invoke-RestMethod -Uri 'https://api.github.com/repos/pawelsalawa/sqlitestudio/releases?per_page=30'
    $ver = ($releasesApi | Where-Object { $_.tag_name -like '3.*' -and -not $_.prerelease } | Select-Object -First 1).tag_name
    if (-not $ver) { throw 'No SQLiteStudio 3.x release found' }

    return @{
        URL32        = "https://github.com/pawelsalawa/sqlitestudio/releases/download/$ver/sqlitestudio-$ver-windows-x86-installer.exe"
        URL64        = "https://github.com/pawelsalawa/sqlitestudio/releases/download/$ver/sqlitestudio-$ver-windows-x64-installer.exe"
        Version      = $ver
    }
}

update -ChecksumFor none