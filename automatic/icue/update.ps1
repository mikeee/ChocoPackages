#import-module au

. $PSScriptRoot\..\..\scripts\all.ps1

$releases    = 'https://www.corsair.com/ww/en/icue'

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
    $releases    = 'https://help.corsair.com/hc/en-us/sections/360010386591-iCUE-Patch-Notes'
    $page = Invoke-WebRequest -Uri $releases -UseBasicParsing -UserAgent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36 Edge/12.246"
    $regexVersion = 'Patch\snotes\sfor\siCUE\sversion\s(?<version>[\d\.]+)'

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