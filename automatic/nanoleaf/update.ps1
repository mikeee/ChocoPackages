#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1

$releases    = 'https://my.nanoleaf.me/api/v2/desktopApp/latest/win'
$checksumType = 'SHA256'

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
    $tempFile = New-TemporaryFile
    Invoke-WebRequest -Uri $releases -OutFile $tempFile -UseBasicParsing

    $version = (Get-Item $tempfile).VersionInfo.FileVersion

    $checksum = Get-FileHash -Algorithm SHA256 -Path $tempFile -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Hash

    $url = "https://desktop-app-prod-1.s3.us-west-2.amazonaws.com/Nanoleaf+Desktop+Setup+$version.exe"

    return @{
        URL          = $url
        Checksum     = $checksum
        ChecksumType = $checksumType
        Version      = $version
    }
}

update -ChecksumFor none

