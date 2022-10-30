#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1

$releases    = 'https://www.corsair.com/uk/en/downloads'

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
    $page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $regexVersion = 'CORSAIR\sUtility\sEngine\s\(iCUE\)\sSoftware\s(?<version>[\d\.]+)'

    $matched = $page.Content -match $regexVersion

    If ($False -ne $matched) {
        $url = -join("https://downloads.corsair.com/Files/CUE/iCUESetup_",$matches["version"],"_release.msi")
        $version = $matches["version"]
    }

    return @{
        URL        = $url
        Version    = $version
    }
}

update -ChecksumFor none