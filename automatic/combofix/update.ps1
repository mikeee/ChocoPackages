#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1

$releases    = 'https://download.bleepingcomputer.com/sUBs/ComboFix.exe'

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
    $tempFile = New-TemporaryFile
    Invoke-WebRequest -Uri $releases -OutFile $tempFile -UseBasicParsing
    $version = (Get-Item $tempfile).VersionInfo.FileVersion

    return @{
        URL          = $releases
        Version      = $version
    }
}

update -ChecksumFor none