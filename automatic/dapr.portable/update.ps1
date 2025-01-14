#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1

$releases    = 'https://github.com/dapr/cli/releases'

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
    $Latest.Checksum64 = Get-RemoteChecksum $Latest.URL64
    $Latest.ChecksumType64 = 'SHA256'
}

function global:au_AfterUpdate {
    Set-DescriptionFromReadme -SkipFirst 2
}

function global:au_GetLatest {
    $page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $regexUrl64 = '\/dapr\/cli\/releases\/download\/v(?<version>[\d\.]+)\/dapr\.msi'

    $matched = $page.links | Where-Object href -match $regexUrl64 | Select-Object -First 1 -expand href

    If ($False -ne $matched) {
        $version = $matches["version"]
    }


    return @{
        URL64        = "https://github.com/dapr/cli/releases/download/v"+$matches.version+"/dapr_windows_amd64.zip"
        Version      = $version
    }
}

update -ChecksumFor none
